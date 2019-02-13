require 'bundler/setup'
require_relative '../lib/user_stories/introduction.rb'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
