defmodule TweetTwitterTest do
  use ExUnit.Case
  doctest TweetTwitter

  test "greets the world" do
    assert TweetTwitter.hello() == :world
  end

  test "don't greet the world" do
    assert TweetTwitter.hello() == :world
  end
end
