defmodule FileReaderTest do
  use ExUnit.Case
  import TweetTwitter.FileReader
  import Mock

  doctest TweetTwitter.FileReader

  test "Passing a file should return a string" do
    str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:tweet_twitter)}", "sample.txt"))
    assert str != nil
  end

  test "will not return a string longer than 140 characters" do
    str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:tweet_twitter)}", "/test/too_long.txt"))
    assert String.length(str) < 140
  end

  test "An empty string should return an empty string" do
    str = pick_string("")
    assert str == ""
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn(_) -> " ABC " end] do
      str = get_strings_to_tweet("doesn't exist.txt")

      assert str == "ABC"
    end
  end

  test "Should return an empty string" do
    with_mock File, [read!: fn(_) -> "" end] do
      str = pick_string("")
      assert str == ""
    end
  end
end