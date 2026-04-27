#!/bin/bash
set -ex

APP_DIR=/home/ec2-user/app

echo "Checking if files exist:"
ls -la $APP_DIR

cd $APP_DIR

sudo yum update -y
sudo yum install python3 -y

python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip

if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "❌ requirements.txt STILL missing → deployment copy failed"
    exit 1
fi
