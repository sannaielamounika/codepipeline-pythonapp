#!/bin/bash
set -ex

APP_DIR=/home/ec2-user/app

echo "==== DEBUG: Finding deployment archive ===="

DEPLOY_DIR=$(find /opt/codedeploy-agent/deployment-root -name deployment-archive | head -1)

echo "Deployment dir: $DEPLOY_DIR"

echo "==== Files inside deployment archive ===="
ls -l $DEPLOY_DIR

echo "==== Copying files to app directory ===="
rm -rf $APP_DIR/*
cp -r $DEPLOY_DIR/* $APP_DIR/

cd $APP_DIR

echo "==== Files in app directory ===="
ls -l

# Install Python
sudo yum update -y
sudo yum install python3 -y

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip

# Install dependencies
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "❌ requirements.txt STILL missing after copy"
    exit 1
fi
