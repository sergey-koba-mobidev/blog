#!/usr/bin/env bash
gem update bundler
bundle install
cd public && bower install
