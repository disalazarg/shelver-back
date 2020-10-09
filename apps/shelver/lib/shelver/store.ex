defmodule Shelver.Store do
  @moduledoc """
  Context module for the Reflex state
  """
  alias Shelver.State
  alias Shelver.Model.Book

  @type id :: String.t()

  @spec list_books() :: list(Book.t())
  def list_books() do
    State.list(Book, [])
  end

  @spec get_book(id) :: Book.t()
  def get_book(id) do
    State.get(Book, [id])
  end

  @spec create_book(Book.t()) :: {:ok, Book.t()} | {:error, String.t()}
  def create_book(book = %Book{}) do
    State.put(Book, [book.id], book)
  end
end
