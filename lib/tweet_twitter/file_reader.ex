defmodule TweetTwitter.FileReader do
  @doc """
  This function read contents from a file and
  find a string that can be tweeted out.

  It will trim all strings, and then elimate any
  strings that are larger than 140 characters.

  iex> TweetTwitter.FileReader.get_strings_to_tweet("priv/test/doc.txt")
  "Life is too short"

  iex> TweetTwitter.FileReader.get_strings_to_tweet("priv/test/too_long.txt")
  "Short line."
  """
  def get_strings_to_tweet(path) do
    # read will return a tuple, in this case ok and contents. 
    # read! with exclamation point will raise an error if the file cannot be read.
    File.read!(path)
    |> pick_string
   
  end

  def pick_string(str) do
    str
    # removes new line character using String.split("\n")
    |> String.split("\n")
    # remove whitespace from lines both at the start or end of string
    |> Enum.map(&String.trim/1)
    # Make string less than or equal to 140 char
    |> Enum.filter(fn str -> String.length(str) <= 140 end)
    # the above function could be written as  |> Enum.filter(&String.length(&1) <= 140)

    # pick a random string to tweer
    |> Enum.random()
  end
end