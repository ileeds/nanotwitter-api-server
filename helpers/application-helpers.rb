require 'typhoeus'
require 'byebug'
require 'json'

class ApplicationHelpers
  def initialize (name)
    @name = name
  end

  def find_tweet(id)
    start("/tweet/#{id}")
  end

  def find_user(id)
    start("/users/#{id}")
  end

  def recent_tweets(tweets)
    start("/tweets/recent?n=#{tweets}")
  end

  def users_recent_tweets(id, tweets)
    start("/users/#{id}/tweets?n=#{tweets}")
  end

  def start (url)
    request = Typhoeus::Request.new(
      "https://biz-nanotwitter.herokuapp.com/api/v1"+url,
      method: :get,
    )

    request.on_complete do |response|
      if response.success?
        return response.body
      elsif response.timed_out?
        return "aw hell no"
      elsif response.code == 0
        return response.return_message
      else
        return "HTTP request failed: " + response.code.to_s
      end
    end

    request.run

  end

end
