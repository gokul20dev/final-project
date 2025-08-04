#!/bin/bash

set -e

echo "👉 Installing dependencies..."
npm install --verbose

echo "✅ Dependencies installed."

echo "👉 Building React app..."
npm run build

echo "✅ React build complete."

echo "👉 Building Docker image..."
docker build -t $1 .

echo "✅ Docker image built."

echo "👉 Pushing Docker image..."
docker push $1

echo "✅ Docker image pushed to $1"
