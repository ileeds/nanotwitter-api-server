require_relative 'NanotwitterClient.rb'

a=NanotwitterClient.new("client")
result=a.find_user(10)
resultTwo=a.users_recent_tweets(10,5)
puts result
puts resultTwo
