use Mix.Config

# config Quantum for this application
config :tweet_twitter, TweetTwitter.Scheduler,
  jobs: [
    # Every minute
    {"* * *", fn -> 
      TweetTwitter.FileReader.get_strings_to_tweet(
        Path.join("#{:code.priv_dir(:tweet_twitter)}", "sample.txt")
      )
      |> TweetTwitter.TweetServer.tweet
    end
    }
  ]
