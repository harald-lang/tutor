Tutor Tool
==========


# Setup
1. `git clone` this repo
2. install ruby tools: `gem install rdoc && gem install bundler && gem install rake`
3. run `bundle install --path vendor/bundle` to install any backend dependencies
4. run `bower install` for frontend deps - (You'll need nodejs+bower for this)
5. create your db: `rake db:migrate RAILS_ENV=development`
6. run the bundled *thin* webserver: `bundle exec thin start`

# Screenshots
![Analysis view](https://raw.github.com/henrik-muehe/tutor/master/screenshots/analysis.png)
![Tutor view](https://raw.github.com/henrik-muehe/tutor/master/screenshots/tutor.png)
![Rooms view](https://raw.github.com/henrik-muehe/tutor/master/screenshots/rooms.png)
