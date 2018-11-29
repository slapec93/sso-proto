FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /sso-proto
WORKDIR /sso-proto
COPY Gemfile /sso-proto/Gemfile
COPY Gemfile.lock /sso-proto/Gemfile.lock
RUN bundle install
COPY . /sso-proto