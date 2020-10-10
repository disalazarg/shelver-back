defmodule ShelverWeb.BookSchemaTest do
  use ShelverWeb.SchemaCase

  alias Shelver.State
  alias Shelver.Model.Book

  describe "book queries" do
    setup [:reset_store, :setup_data]

    test "responds with a list of books", %{conn: conn, book: book} do
      q = "{ list_books { id title }}"
      conn = post conn, "/api/graphql", ql_query(q, "list_books")
      data = json_response(conn, 200)["data"]["list_books"]

      assert is_list(data)
      json = List.first(data)

      refute is_nil(json["id"])
      assert json["title"] == book.title
      assert json["author"] == book.author
    end

    test "give info on a single book", %{conn: conn, book: book} do
      q = "{ get_book(id: \"asdf\") { id title }}"
      conn = post conn, "/api/graphql", ql_query(q, "get_book")
      json = json_response(conn, 200)["data"]["get_book"]

      refute is_nil(json["id"])
      assert json["title"] == book.title
      assert json["author"] == book.author
    end
  end

  describe "book mutations" do
    setup [:reset_store]

    @tag :skip
    test "can create a book" do
    end
  end

  defp reset_store(_ctx) do
    State.reset()
  end

  defp setup_data(_context) do
    book = %Book{id: "asdf", title: "Test Title"}
    State.put(Book, ["asdf"], book)

    {:ok, book: book}
  end
end
