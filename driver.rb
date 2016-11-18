require_relative 'NanotwitterClient.rb'

puts "Started"
a=NanotwitterClient.new("client")
a.find_tweet(1)
