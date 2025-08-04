#!/bin/bash

IMAGE_NAME=$1

docker-compose down || true
docker-compose up -d --build

echo "✅ Deployed Docker container from image: $IMAGE_NAME"

