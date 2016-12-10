FROM ruby:2.3.1

# Pg
RUN apt-get update -qq && apt-get install \
    -y build-essential libpq-dev

# Node Npm Bower
RUN apt-get update -qq && apt-get install \
    -y nodejs-legacy npm
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# Bundle
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem update bundler && bundle install --jobs 4

# Copy the rest of Rails source
COPY . /app

# Run bower
WORKDIR $APP_ROOT/public
RUN bower install

WORKDIR $APP_ROOT