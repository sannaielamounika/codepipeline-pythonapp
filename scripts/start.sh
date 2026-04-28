#!/bin/bash
set -ex

APP_DIR=/home/ec2-user/app
cd $APP_DIR

echo "Starting Flask app..."

source venv/bin/activate

pkill -f app.py || true

nohup python app.py > output.log 2>&1 &
