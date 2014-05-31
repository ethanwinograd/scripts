#!/bin/sh

echo "getting curl..."
sudo apt-get install curl

echo "getting rvm"
\curl -L https://get.rvm.io | bash -s stable

echo "sourcing rvm."
source ~/.rvm/scripts/rvm

echo "rvm requirements.."
rvm requirements

echo "echo getting ruby and jruby"
rvm install ruby
rvm install jruby

echo "setting default to jruby"
rvm --default use jruby

echo "rubygems current"
rvm rubygems current

echo "installing rails"
gem install rails



