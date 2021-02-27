FROM ruby:'2.6.3'

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       node.js

RUN mkdir /app_name

ENV APP_PORT /app_name
WORKDIR $APP_PORT

ADD ./Gemfile $APP_PORT/Gemfile
ADD ./Gemfile.lock $APP_PORT/Gemfile.lock

RUN bundle install
ADD . $APP_PORT
