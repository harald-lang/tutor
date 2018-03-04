#!/bin/bash

rm -rf /src/tmp/
mkdir /src/tmp
#chown -R user: /src
#chown -R user: /usr/local/rvm/
#chmod 755 /src/sudoscript

# start postfix
rm -rf /var/spool/postfix/private/
rm -rf /var/spool/postfix/public/
/etc/init.d/postfix restart

#/usr/sbin/sshd &
#/usr/sbin/cron

cd /src

#gem install bundler
#gem install rake
#gem install rails

#bundle install
#bower install --allow-root

RAILS_ENV=production bundle exec rake assets:precompile

rake db:migrate RAILS_ENV=production
sqlite3 db/production.sqlite3 < setup.sql

bin/rails server -p 8080 -e production