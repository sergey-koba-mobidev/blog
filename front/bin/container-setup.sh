#!/bin/sh
gem update bundler
bundle install
cd public && bower install
