FROM ruby:2.6.1-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential libpq-dev

ENV INSTALL_PATH /onebitbot

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./
RUN gem update --system
RUN gem install bundler
RUN bundle install
RUN bundler update --bundler

COPY . .

CMD rackup config.ru -o 0.0.0.0
