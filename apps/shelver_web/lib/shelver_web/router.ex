defmodule ShelverWeb.Router do
  use ShelverWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug.GraphiQL, schema: ShelverWeb.Schema
  end
end
