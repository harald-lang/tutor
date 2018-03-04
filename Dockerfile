FROM ruby:2.5
MAINTAINER Harald Lang <harald.lang@in.tum.de>

# NodeJS is broken in Debian Stretch Repos, just use the offical mirrors for now
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

# Install apt based dependencies required to run Rails as well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y build-essential nodejs

# Configure the main working directory. This is the base directory used in any further RUN, COPY, and ENTRYPOINT commands.
RUN mkdir -p /src
WORKDIR /src

# Copy the Gemfile as well as the Gemfile.lock and install the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Install bower deps
RUN npm -g install bower
RUN bower install --allow-root

#EXPOSE 22 8080
EXPOSE 8080
ENTRYPOINT ["/src/startup.sh"]