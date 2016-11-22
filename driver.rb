require_relative 'NanotwitterClient.rb'

a=NanotwitterClient.new("client")
result=a.find_tweet(1)
puts result
