require 'bundler'
Bundler.require :default
set :database, {adapter: "sqlite3", database: "foo.sqlite3"}

class MyApp < Sinatra::Base
  enable :sessions, 'chuj'
end
