#!/bin/bash

set -e


echo "👉 Building Docker image..."
docker build -t $1 .

echo "✅ Docker image built."

echo "👉 Pushing Docker image..."
docker push $1

echo "✅ Docker image pushed to $1"
