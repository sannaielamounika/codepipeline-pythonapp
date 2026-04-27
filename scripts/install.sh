#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app

cd $APP_DIR

echo "Current directory:"
pwd
ls -l   # 👈 DEBUG

sudo yum update -y
sudo yum install python3 python3-venv -y

python3 -m venv venv
source venv/bin/activate

python3 -m pip install --upgrade pip

# safer install
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "requirements.txt not found!"
    exit 1
fi
