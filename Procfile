# web: bundle exec thin start
web: bundle exec puma -p $PORT -e $RACK_ENV   # Command to start your server
worker: bundle exec sidekiq                   # Command to start sidekiq
redis: redis-server                           # Command to start redis