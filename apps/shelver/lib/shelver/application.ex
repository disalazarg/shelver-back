defmodule Shelver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      Shelver.State,
      {Phoenix.PubSub, name: Shelver.PubSub}
      # Start a worker by calling: Shelver.Worker.start_link(arg)
      # {Shelver.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Shelver.Supervisor)
  end
end
