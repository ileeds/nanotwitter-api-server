class Controller < ApplicationController
  require './helpers/application-helpers.rb'

  get '/' do
    erb :index
  end
end
