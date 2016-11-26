require 'typhoeus'
require 'byebug'
require 'json'

class ApplicationHelpers
  def find_tweet(id)
    start("/tweet/#{id}")
  end

  def find_user(id)
    start("/users/#{id}")
  end

	#tweets is 'how many recent tweets you want'
  def recent_tweets(count)
    start("/recent/tweets/#{count}")
  end

  def users_recent_tweets(id, count)
    start("/users/#{id}/tweets/#{count}")
  end

  def start (url)
    request = Typhoeus::Request.new(
      "https://biz-nanotwitter.herokuapp.com/api/v1"+url,
      method: :get,
			# "http://localhost:4567/api/v1"+url,
      # method: :get,
    )

    request.on_complete do |response|
      if response.success?
        return response.body
      elsif response.timed_out?
        puts "sorry, you timed out"
      elsif response.code == 0
        return response.return_message
      else
        return "HTTP request failed: " + response.code.to_s
      end
    end

    request.run

  end

end
