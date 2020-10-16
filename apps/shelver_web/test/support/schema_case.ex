defmodule ShelverWeb.SchemaCase do
  @moduledoc """
  Defines a test case for use in testing GraphQL Schemas
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      use ShelverWeb.ConnCase

      import ShelverWeb.SchemaCase
    end
  end

  def ql_query(query, name) do
    %{
      "operationName" => name,
      "query" => "query #{name} #{query}",
      "variables" => "{}"
    }
  end

  def ql_mut(mut, name) do
    %{
      "operationName" => name,
      "query" => "mutation #{name} #{mut}",
      "variables" => "{}"
    }
  end
end
