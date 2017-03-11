# config.ru
require './core'
require 'sinatra/base'

# pull in the helpers and controllers
Dir.glob('./app/{models,helpers}/*.rb').each do |file|
   require file
end
Dir.glob('./app/{controllers}/*.rb').each do |file|
   require file
end
Dir.glob('./app/controllers/admin/*.rb') { |ac| require ac }

map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/admin/boards') { run BoardsController }
