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

echo "🛠️ Building and pushing image: $IMAGE"
docker build -t $IMAGE .
docker login -u $DOCKER_USER -p $DOCKER_PASS
docker push $IMAGE

