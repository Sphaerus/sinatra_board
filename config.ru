Bundler.require :default
require './core'

map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/admin/boards') { run BoardsController }
