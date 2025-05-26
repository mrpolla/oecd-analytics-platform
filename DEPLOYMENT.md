# OECD Analytics Platform - Deployment Guide

## Prerequisites

- Docker & Docker Compose
- 16GB RAM minimum
- 50GB disk space
- Ports: 80, 8000, 8080, 9000, 9001, 3000, 9090

## Quick Start

```bash
# Clone repository
git clone <your-repo-url>
cd oecd-analytics-platform

# Create environment files
cp .env.example .env
cp infrastructure/docker/.env.docker.example infrastructure/docker/.env.docker

# Deploy everything
./deploy-prod.sh
```
