require_relative 'NanotwitterClient.rb'

a=NanotwitterClient.new("client")
result=a.find_user(10)
puts result
