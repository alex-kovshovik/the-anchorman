FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libpq-dev libxml2-dev libxslt1-dev libqt4-webkit libqt4-dev xvfb nodejs

ENV APP_ROOT /the-anchorman
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile* $APP_HOME/
RUN bundle install
