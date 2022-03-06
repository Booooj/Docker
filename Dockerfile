FROM ruby:2.7.4

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client \
    yarn

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp
