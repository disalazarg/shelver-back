defmodule ShelverWeb.BookSchema do
  @moduledoc """
  GraphQL schema for Books
  """
  use Absinthe.Schema.Notation

  alias Shelver.Store

  object :book do
    field(:id, non_null(:string))
    field(:title, non_null(:string))
    field(:author, :string)
    field(:description, :string)
  end

  object :book_queries do
    @desc "List books"
    field :list_books, list_of(:book) do
      resolve(&Store.list_books/2)
    end

    @desc "Get book"
    field :get_book, :book do
      arg(:id, :string)

      resolve(&Store.get_book/2)
    end
  end

  object :book_mutations do
    @desc "Create book"
    field :create_book, :book do
      arg(:title, non_null(:string))
      arg(:author, :string)
      arg(:description, :string)

      resolve(&Store.create_book/2)
    end
  end
end
