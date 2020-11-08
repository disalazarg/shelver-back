defmodule Mix.Tasks.Db.Setup do
  @moduledoc """
  Setups the Cassandra persistence layer
  """

  use Mix.Task
  require Logger

  alias Shelver.DB

  @keyspace_stmt "create keyspace if not exists shelver with replication = {'class': 'NetworkTopologyStrategy', 'DC1' : 1, 'DC2' : 3} AND durable_writes = true;"
  @table_stmt "create table if not exists shelver.books (id text primary key, title text, author text, description text);"

  @impl Mix.Task
  def run(_args) do
    with {:ok, _args} <- Application.ensure_all_started(:shelver),
         {:ok, _void} <- DB.exec(@keyspace_stmt),
         {:ok, _void} <- DB.exec(@table_stmt) do
      Logger.info("Database initialized")
    else
      error ->
        Logger.error(inspect(error))
    end
  end
end
