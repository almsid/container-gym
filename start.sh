#!/bin/bash

# Container Gym Startup Script

set -e

echo "================================"
echo "   Welcome to Container Gym!   "
echo "================================"
echo ""

# Check Docker availability
if ! docker version &>/dev/null; then
    echo "❌ Docker is not available. Please ensure Docker is installed and running."
    exit 1
fi

# Always pull the latest gymctl image
GYMCTL_IMAGE="ghcr.io/shart-cloud/gymctl:latest"
echo "📦 Pulling latest gymctl image from registry..."
docker pull $GYMCTL_IMAGE
echo "✅ Latest image pulled successfully!"

# Start the environment
echo ""
echo "🚀 Starting Container Gym environment..."
docker-compose up -d

# Wait for container to be ready
echo "⏳ Waiting for container to be ready..."
sleep 2

# Show status
docker-compose ps

echo ""
echo "================================"
echo "Container Gym is ready!"
echo ""
echo "To connect:"
echo "  docker exec -it container-gym /bin/bash"
echo "  OR"
echo "  make shell"
echo ""
echo "Once connected, run:"
echo "  gymctl list      # See available exercises"
echo "  gymctl start <exercise>  # Start an exercise"
echo "================================"