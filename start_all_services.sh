#!/bin/bash
# start_all_services.sh - Starts all OECD platform containers

echo "🚀 Starting all OECD Analytics Platform services..."

cd infrastructure/docker

# Create network if it doesn't exist
echo "🌐 Creating network..."
docker network create oecd-network || echo "Network already exists"

# Start main services first
echo "🏗️  Starting main application services..."
docker compose -f docker-compose.yml up -d

echo "⏳ Waiting for main services to be ready..."
sleep 10

# Start monitoring services
echo "📊 Starting monitoring services..."
docker compose -f docker-compose.monitoring.yml up -d

echo "⏳ Waiting for monitoring services..."
sleep 5

# Start Jenkins last
echo "📱 Starting Jenkins..."
docker compose -f docker-compose.jenkins.yml up -d

echo "⏳ Waiting for Jenkins to initialize..."
sleep 15

echo "✅ All services started!"
echo ""
echo "📋 Service Status:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""
echo "🌐 Access URLs:"
echo "   Dashboard:    http://localhost"
echo "   API Docs:     http://localhost:8000/docs"
echo "   Jenkins:      http://localhost:8090"
echo "   MinIO:        http://localhost:9001"
echo "   Grafana:      http://localhost:3000"
echo "   Prometheus:   http://localhost:9090"