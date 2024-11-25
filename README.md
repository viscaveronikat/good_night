# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 3.3.6
* API Endpoints
  - get clock in list (GET /api/v1/clock_in_records)
  - insert clock in (POST /api/v1/clock_in_records)
  - follow a user (POST /api/v1/follow)
  - unfollow a user (POST /api/v1/unfollow)
  - sleep-records sorted by duration (GET /api/v1/sleep_records?user_id=1)

* Setup
bundle install
rails db:drop db:create db:migrate db:seed
rails s

* ...
# good_night
