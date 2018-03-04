#!/bin/bash

echo 	"cd /src ; \
		source /usr/local/rvm/scripts/rvm ;
		rvm install ruby-2.3.3 ; \
		rvm ruby-version use 2.3.3 ; \
		rvm use . ; \
		gem install bundler ; \
		gem install rails ; \
		bundle update rails json sqlite3 ; \
		bundle install ; \
		bower install --allow-root; \
		rake db:migrate RAILS_ENV=production;  \
		RAILS_ENV=production bundle exec rake assets:precompile ; \
		sqlite3 db/production.sqlite3 < fakedata.sql ; \
		bin/rails server -p 8080 -e production; sleep 5" > /src/sudoscript
rm -rf /src/tmp/
mkdir /src/tmp
chown -R user: /src
chown -R user: /usr/local/rvm/
chmod 755 /src/sudoscript

# start postfix
rm -rf /var/spool/postfix/private/
rm -rf /var/spool/postfix/public/
/etc/init.d/postfix restart

/usr/sbin/sshd &
/usr/sbin/cron

cd /src

echo "insert into users values (1,null,null,'passing@in.tum.de','',null,null,null,0,null,null,null,null,'Linnea','P
assing',null,'admin'); insert into courses values (1,'test1',1,null,null,null);" > fakedata.sql

#sudo -i -u user -- bash /src/sudoscript
export TERM=screen
script /tmp/script -c 'tmux new "cd /src ; sudo -i -u user -- bash /src/sudoscript"'
