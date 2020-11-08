defmodule Shelver.DB do
  @moduledoc """
  Context module for the persistence layer
  """

  use GenServer

  def init(opts), do: {:ok, opts}

  def start_link(_opts) do
    {:ok, conn} = Xandra.start_link(nodes: ["127.0.0.1:9042"])

    GenServer.start_link(__MODULE__, %{conn: conn}, name: __MODULE__)
  end

  def exec(statement, vars \\ []), do: GenServer.call(__MODULE__, {:exec, statement, vars})

  def handle_call({:exec, statement, vars}, _from, state = %{conn: conn}) do
    {:reply, Xandra.execute(conn, statement, vars), state}
  end
end
