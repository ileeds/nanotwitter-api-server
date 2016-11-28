require './helpers/application-helpers.rb'
require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require './config/environments'
require 'byebug'
require "json"
require './models/user'
require './models/tweet'
require './models/like'
require './models/follow'
require './models/hashtag'

get '/' do
  erb :index
end

get '/api/v1/users/:id' do
	if User.exists?
		return User.find(params[:id]).to_json(only: [:id, :username, :fname, :lname, :bio])
	else
		return "User does not exist"
	end
end

#find tweet
get '/api/v1/tweets/:id' do
	#/api/v1/recent/tweets/?count=3
	return Tweet.find(params[:id]).to_json
end

#recent tweets
get '/api/v1/recent/tweets' do
  byebug
	params[:count] ||= 10
	return Tweet.last(params[:count]).to_json
end

#get tweets by a single user
get '/api/v1/users/:id/tweets' do
	Tweet.where(user_id: params[:id]).limit(params[:count]).to_json
end

#get followers NEED TO IMPLEMENT
get '/api/v1/users/:id/followers' do
	if User.exists?(:id => params[:id]) && Follow.exists?(:ing_id => params[:id])
		followers = Follow.where(:ing_id => params[:id])
		return followers.to_json
	end
end

#get following NEED TO IMPLEMENT
get '/api/v1/users/:id/following' do
	#/api/v1/users/3/following
	if User.exists?(:id => params[:id]) && Follow.exists?(:er_id => params[:id])
		following = Follow.where(:er_id => params[:id])
		puts following
		return following.to_json
	end
end
