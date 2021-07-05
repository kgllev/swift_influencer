defmodule SwiftInfluencerWeb.FriendsControllerTest do
  use SwiftInfluencerWeb.ConnCase

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Friends

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:friends) do
    {:ok, friends} = Twitter.create_friends(@create_attrs)
    friends
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all friends", %{conn: conn} do
      conn = get(conn, Routes.friends_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create friends" do
    test "renders friends when data is valid", %{conn: conn} do
      conn = post(conn, Routes.friends_path(conn, :create), friends: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.friends_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.friends_path(conn, :create), friends: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update friends" do
    setup [:create_friends]

    test "renders friends when data is valid", %{conn: conn, friends: %Friends{id: id} = friends} do
      conn = put(conn, Routes.friends_path(conn, :update, friends), friends: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.friends_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, friends: friends} do
      conn = put(conn, Routes.friends_path(conn, :update, friends), friends: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete friends" do
    setup [:create_friends]

    test "deletes chosen friends", %{conn: conn, friends: friends} do
      conn = delete(conn, Routes.friends_path(conn, :delete, friends))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.friends_path(conn, :show, friends))
      end
    end
  end

  defp create_friends(_) do
    friends = fixture(:friends)
    {:ok, friends: friends}
  end
end
