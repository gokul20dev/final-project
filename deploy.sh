#!/bin/bash
docker rm -f devops-react-app || true
docker run -d -p 80:80 --name devops-react-app $1
