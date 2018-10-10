FROM ruby:2.5
MAINTAINER Harald Lang <harald.lang@in.tum.de>

# NodeJS is broken in Debian Stretch Repos, just use the offical mirrors for now
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

# Install apt based dependencies required to run Rails as well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y build-essential nodejs

# Need yarn/bower for frontend deps
RUN npm -g install yarn bower

# Configure the main working directory. This is the base directory used in any further RUN, COPY, and ENTRYPOINT commands.
RUN mkdir -p /src
WORKDIR /src

# Copy the Gemfile as well as the Gemfile.lock and install the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Install bower deps
COPY yarn.lock package.json ./
RUN cd ./
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN yarn

# Copy the main application.
COPY . ./

# There is a symlink that breaks ruby, so delete it before we compile assets
#RUN rm /src/vendor/assets/components
RUN mkdir /src/vendor/assets/components
RUN cp -a /src/node_modules/@bower_components/* /src/vendor/assets/components

# Assets will never change after the build, so we can precompile them
RUN rake assets:precompile

EXPOSE 8080
ENTRYPOINT ["/src/startup.sh"]