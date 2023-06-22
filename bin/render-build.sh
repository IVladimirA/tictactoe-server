#!/usr/bin/env bash

set -o errexit

bundle install

echo AAAAAAAAAAAAAAAAAA
echo BBBBBBBBBBBB
echo CCCCCCCCCCCCCC

bundle exec rails db:migrate