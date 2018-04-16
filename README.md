Tutor Tool
==========


# Run with docker
1. Start the container, then login using admin@db.in.tum.de / admin123
```
docker run  -v /opt/tutor:/src/persistency \
            -p 8080:8080 \
            -d \
            --name tutor \
            -e GMAIL_USERNAME='username@gmail.com' \
            -e GMAIL_PASSWORD='XXX' \
            -e ADMIN_EMAIL='admin@example.com' \
            -e SERVER_NAME='tutor.example.com' \
            kordianbruck/tutor
```

Environment Variables:
```
SECRET_KEY_BASE - (optional) will be generated on container start. at least 30 characters and all random,
EMAIL_SENDER - (optional) Default: no-reply@in.tum.de
EMAIL_SENDER_FULL - (optional) Default: Tutor Tool <no-reply@in.tum.de>
GMAIL_USERNAME - Username for email sending via SMTP
GMAIL_PASSWORD - Password for email sending via SMTP
ADMIN_EMAIL - Admin email to receive errors
SERVER_NAME - server name for the email links to be generated
```

# Developer Setup
1. `git clone` this repo
2. install ruby tools: `gem install rdoc && gem install bundler && gem install rake && gem install rails`
3. run `bundle install --path vendor/bundle` to install any backend dependencies
4. run `yarn` for frontend deps - (You'll need nodejs+yarn+bower for this)
5. create your db: `rake db:migrate RAILS_ENV=development`
6. run tests `bundle exec rake`
6. run the bundled webserver: `bin/rails server`

# Screenshots
![Analysis view](https://raw.github.com/henrik-muehe/tutor/master/screenshots/analysis.png)
![Tutor view](https://raw.github.com/henrik-muehe/tutor/master/screenshots/tutor.png)
![Rooms view](https://raw.github.com/henrik-muehe/tutor/master/screenshots/rooms.png)
