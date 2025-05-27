#!/bin/bash
# stop_all_services.sh - Stops all OECD platform containers

echo "🛑 Stopping all OECD Analytics Platform services..."

cd infrastructure/docker

# Stop all services in reverse order (Jenkins last)
echo "🏗️  Stopping main application services..."
docker compose -f docker-compose.yml down

echo "📊 Stopping monitoring services..."
docker compose -f docker-compose.monitoring.yml down

echo "📱 Stopping Jenkins..."
docker compose -f docker-compose.jenkins.yml down

echo "🧹 Cleaning up unused containers and networks..."
docker container prune -f
docker network prune -f

echo "✅ All services stopped!"
echo ""
echo "📋 Remaining containers:"
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"