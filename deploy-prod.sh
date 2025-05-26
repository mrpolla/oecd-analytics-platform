#!/bin/bash
set -e

echo "🚀 Deploying OECD Analytics Platform - Production"

# Load environment
export $(cat .env | grep -v '^#' | xargs)

# Navigate to docker directory
cd infrastructure/docker

# Pull latest images
echo "📦 Pulling latest images..."
docker compose pull

# Deploy main stack
echo "🔧 Deploying main services..."
docker compose up -d

# Wait for services
echo "⏳ Waiting for services to be healthy..."
sleep 30

# Deploy monitoring
echo "📊 Deploying monitoring stack..."
docker compose -f docker-compose.monitoring.yml up -d

# Run database migrations if needed
echo "🗄️ Checking database..."
docker compose exec api python init-db.py || echo "Database already initialized"

# Show status
echo "✅ Deployment complete!"
docker compose ps
docker compose -f docker-compose.monitoring.yml ps

echo "
🎉 Services available at:
- Dashboard: http://localhost
- API: http://localhost:8000/docs
- MinIO: http://localhost:9001
- NiFi: http://localhost:8080/nifi
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000
"