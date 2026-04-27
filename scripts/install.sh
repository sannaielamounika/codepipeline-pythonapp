#!/bin/bash
set -ex

APP_DIR=/home/ec2-user/app

echo "Checking app directory"
ls -l $APP_DIR

cd $APP_DIR

# Fix: remove python3-venv (not supported)
sudo yum update -y
sudo yum install python3 -y

# Create venv
python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip

# Install dependencies
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "requirements.txt not found!"
    exit 1
fi
