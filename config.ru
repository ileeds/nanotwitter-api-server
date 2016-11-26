require './controllers/controller.rb'
# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }
map('/') { run Controller }
