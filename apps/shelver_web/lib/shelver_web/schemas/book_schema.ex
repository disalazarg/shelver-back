defmodule ShelverWeb.BookSchema do
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
      resolve(fn _, _ -> {:ok, Store.list_books()} end)
    end

    @desc "Get book"
    field :get_book, :book do
      arg(:id, :string)

      resolve(fn %{id: id}, _ -> Store.get_book(id) end)
    end
  end

  object :book_mutations do
    @desc "Create book"
    field :create_book, :book do
      arg(:title, non_null(:string))
      arg(:author, :string)
      arg(:description, :string)

      resolve(fn args, _ -> Store.create_book(args) end)
    end
  end
end
