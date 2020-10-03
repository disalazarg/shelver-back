defmodule ShelverWeb.Router do
  use ShelverWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShelverWeb do
    pipe_through :api
  end
end
