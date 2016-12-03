FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install \
    -y build-essential libpq-dev

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem update bundler && bundle install --jobs 4

# Copy the rest of Rails source
COPY . /app
