defmodule TweetTwitter.TweetServer do
  use GenServer
  # gensever is a generic server, its a way to send essage to a process. 
  # Its also a way to make sure even if our process dies we'll be able to restart it.
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end
 
  # For Gensevers, there are two types of calls that are made

  # handle_cast is asynchronous, we're going to use it to sed out our tweet
  def handle_cast({:tweet, tweet}, _) do
    TweetTwitter.Tweet.send(tweet)
    {:noreply, %{}}
  end

  def tweet(tweet) do
    GenServer.cast(:tweet_server, {:tweet, tweet})
  end
end