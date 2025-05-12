#!/bin/bash

# Export WSL IP as environment variable
export WSL_HOST_IP=$(hostname -I | awk '{print $1}')
echo "WSL IP: $WSL_HOST_IP"

# Start Docker services with the profile you need
docker compose down
docker compose up -d

echo "Services started with WSL IP: $WSL_HOST_IP"