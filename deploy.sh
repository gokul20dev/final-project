#!/bin/bash

IMAGE_NAME=$1

echo "👉  Pushing image: $IMAGE_NAME to Docker Hub..."
docker pull $IMAGE_NAME

echo "👉  Deploying using docker-compose..."
docker-compose down || true
docker-compose up -d --build

echo "✅  Deployment completed from image: $IMAGE_NAME"
