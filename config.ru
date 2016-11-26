require './controllers/application_controller.rb'
require './controllers/controller.rb'
map('/') { run Controller }
