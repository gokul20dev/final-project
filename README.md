# DevOps Final Project – CI/CD Pipeline for React App

This project implements a complete CI/CD pipeline for a static React application using Jenkins, Docker, GitHub Actions, AWS EC2, and Uptime Kuma for monitoring.

---

##  Tech Stack

- React (Static Website)
- Jenkins (CI/CD)
- Docker & DockerHub
- GitHub
- AWS EC2
- Uptime Kuma (Monitoring)
- NGINX (Web server)

---

## Docker Images

 Environment | Docker Image Name 
-------------|--------------------
 Dev         | `gokul603/devops-static-dev` 
 Prod        | `gokul603/devops-static-prod`

---

## 🌐 Deployed Application

- **Dev/Prod Site URL**: [[http://](http://13.203.23.57:80)  ](http://13.203.23.57:80)
  

---

## 🔁 CI/CD Pipeline Overview

- **Trigger**: GitHub Webhook on code push
- **Build**: Docker builds the app from source
- **Deploy**:
  - `dev` branch → pushes to public dev Docker image, deploys on EC2
  - `main` branch → pushes to private prod Docker image, deploys on EC2
- **Monitor**: Uptime Kuma checks site availability & alerts if down

---

## 📂 Folder Structure
final-project/
 Dockerfile
 docker-compose.yml
 Jenkinsfile
 .gitignore
 .dockerignore
 .src/

