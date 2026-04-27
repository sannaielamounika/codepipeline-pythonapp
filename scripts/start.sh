#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app

cd $APP_DIR

# Install python3 if not installed
sudo yum update -y
sudo yum install python3 -y

# Create virtual environment
python3 -m venv venv

# Activate it
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt
