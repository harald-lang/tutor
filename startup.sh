#!/bin/bash

# remove any temporary files
rm -rf /src/tmp/
mkdir /src/tmp

# move to our install location inside the image
cd /src

# check for correct env vars
[ -z "$SECRET_KEY_BASE" ] && export SECRET_KEY_BASE=`rake secret` && echo "Generating SECRET_KEY_BASE=$SECRET_KEY_BASE";
[ -z "$EMAIL_SENDER" ]  && export EMAIL_SENDER="no-reply@in.tum.de" && echo "Defaulting EMAIL_SENDER=$EMAIL_SENDER";
[ -z "$EMAIL_SENDER_FULL" ] && export EMAIL_SENDER_FULL="Tutor Tool <no-reply@in.tum.de>" && echo "Defaulting EMAIL_SENDER_FULL=$EMAIL_SENDER_FULL" ;
[ -z "$GMAIL_USERNAME" ] && echo "Please set GMAIL_USERNAME" && exit 2;
[ -z "$GMAIL_PASSWORD" ] && echo "Please set GMAIL_PASSWORD" && exit 3;
[ -z "$ADMIN_EMAIL" ] && echo "Please set ADMIN_EMAIL" && exit 4;
[ -z "$SERVER_NAME" ] && echo "Please set SERVER_NAME" && exit 4;

# precompile assets for production use
RAILS_ENV=production bundle exec rake assets:precompile

# migrate to our newest db version
rake db:migrate RAILS_ENV=production

# start the server
bin/rails server -p 8080 -e production