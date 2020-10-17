defmodule Shelver.State do
  @moduledoc """
  Reflex implementation of a Stateful GenServer for storing book objects in-memory
  """
  use Reflex, state: %{books: %{}}

  alias Shelver.Model.Book

  defmodel(Book, [:book])
end
