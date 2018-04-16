#!/bin/bash

# remove any temporary files
rm -rf /src/tmp/
mkdir /src/tmp

# move to our install location inside the image
cd /src

# precompile assets for production use
RAILS_ENV=production bundle exec rake assets:precompile

# migrate to our newest db version
rake db:migrate RAILS_ENV=production

#Make sure our binaries are here
rake rails:update:bin

# start the server
bin/rails server -p 8080 -e production