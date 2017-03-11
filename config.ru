# config.ru
require './core'
require 'sinatra/base'

# pull in the helpers and controllers
Dir.glob('./{models,helpers}/*.rb').each do |file|
   require file
end
Dir.glob('./{controllers}/*.rb').each do |file|
   require file
end
Dir.glob('./controllers/admin/*.rb') { |ac| require ac }

map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/admin/boards') { run BoardsController }
