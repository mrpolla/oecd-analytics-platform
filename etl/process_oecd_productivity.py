#!/usr/bin/env python3
"""
Process OECD productivity data and store in PostgreSQL
"""
import json
import os
import sys
from datetime import datetime
import psycopg2
from psycopg2.extras import execute_values
from minio import Minio
from dotenv import load_dotenv
import pandas as pd

# Load environment variables
load_dotenv()

def get_minio_client():
    """Initialize MinIO client"""
    return Minio(
        os.getenv("MINIO_ENDPOINT"),
        access_key=os.getenv("MINIO_ACCESS_KEY"),
        secret_key=os.getenv("MINIO_SECRET_KEY"),
        secure=False
    )

def get_postgres_connection():
    """Create PostgreSQL connection"""
    return psycopg2.connect(
        host=os.getenv("POSTGRES_HOST"),
        port=os.getenv("POSTGRES_PORT"),
        database=os.getenv("POSTGRES_DB"),
        user=os.getenv("POSTGRES_USER"),
        password=os.getenv("POSTGRES_PASSWORD")
    )

def create_tables(conn):
    """Create tables if they don't exist"""
    with conn.cursor() as cur:
        # Create productivity table
        cur.execute("""
            CREATE TABLE IF NOT EXISTS oecd_productivity (
                id SERIAL PRIMARY KEY,
                country_code VARCHAR(3),
                country_name VARCHAR(100),
                industry_code VARCHAR(20),
                industry_name VARCHAR(200),
                year INTEGER,
                measure VARCHAR(50),
                value DECIMAL(10,2),
                unit VARCHAR(50),
                transformation VARCHAR(50),
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
        """)
        
        # Create index for faster queries
        cur.execute("""
            CREATE INDEX IF NOT EXISTS idx_productivity_country_year 
            ON oecd_productivity(country_code, year);
        """)
        
        conn.commit()

def parse_oecd_data(json_data):
    """Parse OECD JSON into structured records"""
    records = []
    
    # Extract dimension metadata
    dimensions = json_data['data']['structures'][0]['dimensions']['observation']
    
    countries = {v['id']: v['name'] for dim in dimensions if dim['id'] == 'REF_AREA' for v in dim['values']}
    industries = {v['id']: v['name'] for dim in dimensions if dim['id'] == 'ACTIVITY' for v in dim['values']}
    measures = {v['id']: v['name'] for dim in dimensions if dim['id'] == 'MEASURE' for v in dim['values']}
    units = {v['id']: v['name'] for dim in dimensions if dim['id'] == 'UNIT_MEASURE' for v in dim['values']}
    transformations = {v['id']: v['name'] for dim in dimensions if dim['id'] == 'TRANSFORMATION' for v in dim['values']}
    
    # Extract observations
    observations = json_data['data']['dataSets'][0]['observations']
    
    for key, values in observations.items():
        indices = key.split(':')
        if len(indices) >= 7 and len(values) > 0:
            country_idx = int(indices[0])
            industry_idx = int(indices[3])
            measure_idx = int(indices[2])
            unit_idx = int(indices[4])
            transform_idx = int(indices[6])
            
            # Get actual values from dimension lists
            country_list = list(countries.keys())
            industry_list = list(industries.keys())
            measure_list = list(measures.keys())
            unit_list = list(units.keys())
            transform_list = list(transformations.keys())
            
            record = {
                'country_code': country_list[country_idx] if country_idx < len(country_list) else 'UNK',
                'country_name': list(countries.values())[country_idx] if country_idx < len(countries) else 'Unknown',
                'industry_code': industry_list[industry_idx] if industry_idx < len(industry_list) else 'UNK',
                'industry_name': list(industries.values())[industry_idx] if industry_idx < len(industries) else 'Unknown',
                'year': 2023,  # From the data
                'measure': measure_list[measure_idx] if measure_idx < len(measure_list) else 'UNK',
                'value': float(values[0]),
                'unit': unit_list[unit_idx] if unit_idx < len(unit_list) else 'UNK',
                'transformation': transform_list[transform_idx] if transform_idx < len(transform_list) else 'UNK'
            }
            records.append(record)
    
    return records

def store_in_postgres(conn, records):
    """Store records in PostgreSQL"""
    with conn.cursor() as cur:
        # Prepare data for insertion
        values = [
            (r['country_code'], r['country_name'], r['industry_code'], 
             r['industry_name'], r['year'], r['measure'], r['value'],
             r['unit'], r['transformation'])
            for r in records
        ]
        
        # Bulk insert
        execute_values(
            cur,
            """
            INSERT INTO oecd_productivity 
            (country_code, country_name, industry_code, industry_name, 
             year, measure, value, unit, transformation)
            VALUES %s
            ON CONFLICT DO NOTHING
            """,
            values
        )
        
        conn.commit()
        return cur.rowcount

def process_file(minio_client, bucket, object_name):
    """Process a single file from MinIO"""
    # Get file from MinIO
    response = minio_client.get_object(bucket, object_name)
    json_data = json.loads(response.read())
    response.close()
    
    # Parse data
    records = parse_oecd_data(json_data)
    print(f"Parsed {len(records)} records from {object_name}")
    
    # Store in PostgreSQL
    conn = get_postgres_connection()
    try:
        create_tables(conn)
        inserted = store_in_postgres(conn, records)
        print(f"Inserted {inserted} new records into PostgreSQL")
    finally:
        conn.close()
    
    return len(records)

def main():
    """Main processing function"""
    minio_client = get_minio_client()
    
    # List files in productivity folder
    objects = minio_client.list_objects(
        "oecd-raw-data",
        prefix="oecd/productivity/",
        recursive=True
    )
    
    total_processed = 0
    for obj in objects:
        if obj.object_name.endswith('.json'):
            print(f"\nProcessing {obj.object_name}...")
            try:
                processed = process_file(minio_client, "oecd-raw-data", obj.object_name)
                total_processed += processed
            except Exception as e:
                print(f"Error processing {obj.object_name}: {e}")
    
    print(f"\n✅ Total records processed: {total_processed}")

if __name__ == "__main__":
    main()