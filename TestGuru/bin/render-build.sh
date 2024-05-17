#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rake db:schema:dump
bundle exec rake rake db:schema:load RAILS_ENV=production
bundle exec rails db:migrate RAILS_ENV=production 
