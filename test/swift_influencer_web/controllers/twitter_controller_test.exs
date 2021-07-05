defmodule SwiftInfluencerWeb.TwitterControllerTest do
  use SwiftInfluencerWeb.ConnCase

  alias SwiftInfluencer.Apps
  alias SwiftInfluencer.Apps.Twitter

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:twitter) do
    {:ok, twitter} = Apps.create_twitter(@create_attrs)
    twitter
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all twitters", %{conn: conn} do
      conn = get(conn, Routes.twitter_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create twitter" do
    test "renders twitter when data is valid", %{conn: conn} do
      conn = post(conn, Routes.twitter_path(conn, :create), twitter: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.twitter_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.twitter_path(conn, :create), twitter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update twitter" do
    setup [:create_twitter]

    test "renders twitter when data is valid", %{conn: conn, twitter: %Twitter{id: id} = twitter} do
      conn = put(conn, Routes.twitter_path(conn, :update, twitter), twitter: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.twitter_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, twitter: twitter} do
      conn = put(conn, Routes.twitter_path(conn, :update, twitter), twitter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete twitter" do
    setup [:create_twitter]

    test "deletes chosen twitter", %{conn: conn, twitter: twitter} do
      conn = delete(conn, Routes.twitter_path(conn, :delete, twitter))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.twitter_path(conn, :show, twitter))
      end
    end
  end

  defp create_twitter(_) do
    twitter = fixture(:twitter)
    {:ok, twitter: twitter}
  end
end
