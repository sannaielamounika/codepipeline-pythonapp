#!/bin/bash
set -ex

APP_DIR=/home/ec2-user/app

echo "Creating app directory..."
mkdir -p $APP_DIR
cd $APP_DIR

echo "Files after deployment copy:"
ls -la   # 🔥 IMPORTANT DEBUG

sudo yum update -y
sudo yum install python3 -y

python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip

# safer check
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "❌ requirements.txt missing in deployment bundle"
    exit 1
fi
