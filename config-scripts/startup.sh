!#/bin/bash

# install ruby
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

# install mongodb
sudo apt update
sudo apt install -y mongodb

sudo systemctl start mongodb
sudo systemctl enable mongodb

# deploy app
sudo apt update
sudo apt install -y git
set -e
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
puma -d

ps aux | grep puma
