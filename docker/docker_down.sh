#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: docker_clean <container_name>"
    exit 1
fi

CONTAINER_NAME=$1
echo "Cleaning up container and related resources: $CONTAINER_NAME"

# Check if container exists
if docker ps -a --format '{{.Names}}' | grep -w "^$CONTAINER_NAME$" > /dev/null; then
    # Stop container if running
    if docker ps --format '{{.Names}}' | grep -w "^$CONTAINER_NAME$" > /dev/null; then
        echo "Stopping container..."
        docker stop $CONTAINER_NAME
    fi
    
    # Remove container and volumes
    echo "Removing container and volumes..."
    docker rm -v $CONTAINER_NAME
fi

# Check and remove docker-compose resources
if [ -f "docker-compose.yml" ]; then
    echo "Found docker-compose.yml, removing all related resources..."
    COMPOSE_PROJECT_NAME=$CONTAINER_NAME docker-compose rm -fsv $CONTAINER_NAME
fi

# Remove related images
echo "Removing related images..."
docker images | grep "^$CONTAINER_NAME" | awk '{print $3}' | xargs -r docker rmi

# Remove specific volumes
echo "Removing specific volumes..."
docker volume ls -q | grep "$CONTAINER_NAME" | xargs -r docker volume rm

# Clean build cache
echo "Removing build cache..."
docker builder prune -f --filter until=1h

echo "Cleanup completed for $CONTAINER_NAME"
