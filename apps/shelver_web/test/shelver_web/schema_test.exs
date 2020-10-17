defmodule ShelverWeb.SchemaTest do
  use ShelverWeb.SchemaCase

  describe "server query" do
    test "responds with basic info about the server", %{conn: conn} do
      conn = post conn, "/api/graphql", ql_query("{ server { service version }}", "server")
      json = json_response(conn, 200)["data"]["server"]

      assert json["service"] == "shelver"
      refute is_nil(json["version"])
    end
  end
end
