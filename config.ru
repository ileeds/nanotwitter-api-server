require './controller.rb'
# pull in the helpers and controllers
Dir.glob('./app/{helpers}/*.rb').each { |file| require file }
map('/') { run Controller }
