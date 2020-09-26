#!/bin/bash

docker volume create jenkins
docker build -t jenkins-maven .
docker rm -f jenkins; docker run -p 8080:8080 -p 50000:50000 -v jenkins:/var/jenkins_home --name jenkins jenkins-maven:latest
