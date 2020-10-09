defmodule Shelver.StoreTest do
  use ExUnit.Case

  alias Shelver.{Store, State}
  alias Shelver.Model.Book

  describe "books" do
    setup [:setup_data]

    test "can get a list of books" do
      list = Store.list_books()

      assert Enum.all?(list, fn book -> assert %Book{} = book end)
    end

    test "can create a book" do
      assert {:ok, book} = Store.create_book(%Book{id: "test-id", title: "Test Title"})
    end

    test "can get a book already created" do
      assert {:ok, book} = Store.get_book("asdf")
      assert book.title == "Test Title"
    end
  end

  defp setup_data(_context) do
    State.reset()

    book = %Book{id: "asdf", title: "Test Title"}
    State.put(Book, ["asdf"], book)

    {:ok, book: book}
  end
end
