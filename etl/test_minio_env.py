import os
from dotenv import load_dotenv
from minio import Minio
from minio.error import S3Error
import json
from datetime import datetime

# Load environment variables
load_dotenv()

# Initialize MinIO client using env variables
client = Minio(
    os.getenv("MINIO_ENDPOINT"),
    access_key=os.getenv("MINIO_ACCESS_KEY"),
    secret_key=os.getenv("MINIO_SECRET_KEY"),
    secure=os.getenv("MINIO_SECURE", "false").lower() == "true"
)

print(f"✅ Connected to MinIO at {os.getenv('MINIO_ENDPOINT')}")

# Test connection by listing buckets
try:
    buckets = client.list_buckets()
    print(f"\n📦 Found {len(buckets)} buckets:")
    for bucket in buckets:
        print(f"  - {bucket.name}")
except S3Error as e:
    print(f"❌ Error connecting to MinIO: {e}")