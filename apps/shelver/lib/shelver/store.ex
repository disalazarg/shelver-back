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

  @spec create_book(map()) :: {:ok, Book.t()} | {:error, String.t()}
  def create_book(params = %{title: title}) do
    params = Map.update(params, :id, slugify(title), &slugify/1)
    book = struct(Book, params)
    State.put(Book, [book.id], book)
  end

  @spec slugify(String.t()) :: String.t()
  defp slugify(nil), do: nil

  defp slugify(string) do
    string
    |> String.downcase()
    |> String.replace(~r/\s+/, "-")
  end
end
