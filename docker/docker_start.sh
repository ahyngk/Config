#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: tb_start <container_name>"
    exit 1
fi
export WORKSPACE_PATH='/home/ayk/Workspace'
export UBUNTU_VERSION='ubuntu_22'
export CONTAINER_NAME=$1
COMPOSE_TEMPLATE="${WORKSPACE_PATH}/config/${UBUNTU_VERSION}/tibero_docker/docker-compose.yml"

# Export container name for envsubst
export CONTAINER_NAME
envsubst < "$COMPOSE_TEMPLATE" > docker-compose.yml

# Start container
docker-compose up --build -d

# Clean up temporary docker-compose.yml file
rm docker-compose.yml

echo "Container $CONTAINER_NAME started successfully"
