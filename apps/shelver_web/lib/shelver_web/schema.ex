defmodule ShelverWeb.Schema do
  @moduledoc """
  GraphQL Schema for ShelverWeb
  """
  use Absinthe.Schema

  @desc "Basic server info"
  object :server do
    field(:service, non_null(:string))
    field(:version, non_null(:string))
  end

  query do
    @desc "Get basic server info"
    field :server, non_null(:server) do
      resolve(fn _, _ -> {:ok, %{service: "shelver", version: "0.0.1"}} end)
    end
  end
end
