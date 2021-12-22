defmodule TweetTwitter.Tweet do
  # send function takes a string that we want to send out or tweet
  def send(str) do
    # configure ExTwitter to use twitter environment variables
    ExTwitter.configure(:process, [
      consumer_key: System.get_env("TWEET_TWITTER_CONSUMER_API_KEY"),
      consumer_secret: System.get_env("TWEET_TWITTER_CONSUMER_API_KEY_SECRET"),
      access_token: System.get_env("TWEET_TWITTER_ACCESS_TOKEN"),
      access_token_secret: System.get_env("TWEET_TWITTER_ACCESS_TOKEN_SECRET"),
    ])
    # we need to call ExTwitter.update(str) sends the tweet out.
    ExTwitter.update(str)
  end
end