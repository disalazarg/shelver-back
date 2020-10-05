defmodule Shelver.State do
  use Reflex, state: %{books: %{}}

  alias Shelver.Model.Book

  defmodel(Book, [:book])
end
