defmodule SwiftInfluencerWeb.UnfollowControllerTest do
  use SwiftInfluencerWeb.ConnCase

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Unfollow

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:unfollow) do
    {:ok, unfollow} = Twitter.create_unfollow(@create_attrs)
    unfollow
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all unfollows", %{conn: conn} do
      conn = get(conn, Routes.unfollow_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create unfollow" do
    test "renders unfollow when data is valid", %{conn: conn} do
      conn = post(conn, Routes.unfollow_path(conn, :create), unfollow: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.unfollow_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.unfollow_path(conn, :create), unfollow: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update unfollow" do
    setup [:create_unfollow]

    test "renders unfollow when data is valid", %{conn: conn, unfollow: %Unfollow{id: id} = unfollow} do
      conn = put(conn, Routes.unfollow_path(conn, :update, unfollow), unfollow: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.unfollow_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, unfollow: unfollow} do
      conn = put(conn, Routes.unfollow_path(conn, :update, unfollow), unfollow: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete unfollow" do
    setup [:create_unfollow]

    test "deletes chosen unfollow", %{conn: conn, unfollow: unfollow} do
      conn = delete(conn, Routes.unfollow_path(conn, :delete, unfollow))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.unfollow_path(conn, :show, unfollow))
      end
    end
  end

  defp create_unfollow(_) do
    unfollow = fixture(:unfollow)
    {:ok, unfollow: unfollow}
  end
end
