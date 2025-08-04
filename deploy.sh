#!/bin/bash

BRANCH=$1
if [ "$BRANCH" == "dev" ]; then
  IMAGE="gokul603/devops-react-dev"
elif [ "$BRANCH" == "prod" ]; then
  IMAGE="gokul603/devops-react-prod"
else
  echo "❌ Unknown branch"
  exit 1
fi

echo "🚀 Deploying image: $IMAGE"
docker pull $IMAGE
docker stop react-app || true
docker rm react-app || true
docker run -d --name react-app -p 80:80 $IMAGE





