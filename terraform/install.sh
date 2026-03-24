#!/bin/bash

apt update -y
apt install -y docker.io docker-compose git

systemctl start docker
systemctl enable docker

usermod -aG docker ubuntu