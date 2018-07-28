FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /weather_app

WORKDIR /weather_app

COPY Gemfile /weather_app/Gemfile

COPY Gemfile.lock /weather_app/Gemfile.lock

RUN bundle install

COPY . /weather_app
