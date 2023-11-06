#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
a=1; while [ -n "$(pgrep apt-get)" ]; do echo $a; sleep 1s; a=$(expr $a + 1); done
sleep 60
sudo apt-get install -y git
sleep 60
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
sleep 60
cd $APP_DIR/reddit
bundle install
sleep 100
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
