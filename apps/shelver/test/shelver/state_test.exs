defmodule Shelver.StateTest do
  use ExUnit.Case

  alias Shelver.State
  alias Shelver.Model.Book

  describe "books" do
    test "can create a book" do
      book = %{id: "test", title: "Test Book"}
      State.put(Book, ["test"], book)

      assert {:ok, ^book} = State.get(Book, ["test"])
    end
  end
end
