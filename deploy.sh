#!/bin/bash
docker stop devops-react-container 2>/dev/null && docker rm devops-react-container 2>/dev/null
docker run -d -p 80:80 --name devops-react-container devops-react-app

