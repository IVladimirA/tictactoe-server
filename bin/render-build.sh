#!/usr/bin/env bash

set -o errexit

bundle install

echo AAAAAAAAAAAAAAAAAA
echo BBBBBBBBBBBB
echo CCCCCCCCCCCCCC

bundle exec rake db:migrate
bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails db:migrate
RAILS_ENV=production bundle exec rake db:migrate