#!/bin/bash
set -e

echo "Installing dependencies..."
npm install

echo "Building React app..."
npm run build

echo "Building Docker image: $1"
docker build -t $1 .
