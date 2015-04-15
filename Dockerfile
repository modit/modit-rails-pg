# FROM rails:onbuild

FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/
ADD Gemfile /usr/src/app/Gemfile
RUN bundle install
ADD . /usr/src/app/


CMD bundle exec rake db:schema:load
ENTRYPOINT bundle exec rails s -p 80 -b '0.0.0.0'

