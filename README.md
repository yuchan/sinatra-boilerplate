sinatra-boilerplate
===================

Yet another sinatra boilerplate.
This project is compatible with bower, and compiles assets files in realtime.

I've been searching for best practice to handle assets in sinatra app.
A lot of websites taught me that sprocket is the best answer.
So far, you don't need grunt or other task runner.
I use live reload so that manual rackup never bothers you.
Of course, Sass, and Coffeescript are available.

By default, I choose to use bootstrap, backbone.

Enjoy hacking!

My previous boilerplate experience is [here](https://github.com/yuchan/coffee-boilerplate).

heroku deployment
-----------------

### prepare

    heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
    heroku addons:add heroku-postgresql

### go!

    git push heroku master
