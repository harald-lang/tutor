Tutor Tool
==========


# Run with docker
1. `docker build -t tutor .`
2. `docker run -v /opt/tutor:/src/persistency -p 8080:8080 -d --name tutor tutor`

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
