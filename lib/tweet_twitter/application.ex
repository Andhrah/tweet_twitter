defmodule TweetTwitter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: TweetTwitter.Worker.start_link(arg)
      # {TweetTwitter.Worker, arg}
      TweetTwitter.TweetServer,
      TweetTwitter.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TweetTwitter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
