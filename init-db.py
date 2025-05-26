#!/usr/bin/env python3
"""Initialize database and load sample data"""
import time
import psycopg2
import os
import sys
from dotenv import load_dotenv
# Add the etl directory to path
sys.path.append(os.path.join(os.path.dirname(__file__), 'etl'))
from process_oecd_productivity import create_tables, process_file, get_minio_client


# Detect if running in Docker
IN_DOCKER = os.path.exists('/.dockerenv')

# Load environment variables
if IN_DOCKER:
    load_dotenv('.env.docker')
else:
    load_dotenv('.env')

print("⏳ Waiting for services to start...")
# time.sleep(10)

# Connection parameters
db_params = {
    "host": os.getenv("POSTGRES_HOST"),
    "port": os.getenv("POSTGRES_PORT"),
    "database": os.getenv("POSTGRES_DB"),
    "user": os.getenv("POSTGRES_USER"),
    "password": os.getenv("POSTGRES_PASSWORD")
}

print(f"📊 Connecting to database at {db_params['host']}:{db_params['port']}")

try:
    conn = psycopg2.connect(**db_params)
    print("✅ Connected to database")
    
    
    create_tables(conn)
    print("✅ Database tables created")
    
    # Process files from MinIO if they exist
    try:
        minio_client = get_minio_client()
        objects = minio_client.list_objects("oecd-raw-data", prefix="oecd/productivity/", recursive=True)
        
        file_count = 0
        for obj in objects:
            if obj.object_name.endswith('.json'):
                print(f"📄 Processing {obj.object_name}...")
                process_file(minio_client, "oecd-raw-data", obj.object_name)
                file_count += 1
        
        if file_count > 0:
            print(f"✅ Processed {file_count} files from MinIO")
        else:
            print("⚠️  No files found in MinIO to process")
            
    except Exception as e:
        print(f"⚠️  MinIO processing error: {e}")
        
except Exception as e:
    print(f"❌ Database connection error: {e}")
    sys.exit(1)