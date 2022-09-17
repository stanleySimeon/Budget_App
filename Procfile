// Telling Heroku to run the command `bin/rails server -p 3000` when it starts the web server.
// web: bin/rails server -p 3000
// css: bin/rails tailwindcss:watch
// web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}

app.listen(process.env.PORT || 3000, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});
