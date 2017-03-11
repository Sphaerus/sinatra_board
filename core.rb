require 'sinatra/base'
Bundler.require :default
Dir.glob('./app/{models,helpers}/*.rb').each do |file|
   require file
end
Dir.glob('./app/{controllers}/*.rb').reverse.each do |file|
   require file
end
Dir.glob('./app/controllers/admin/*.rb') { |ac| require ac }

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
