defmodule SwiftInfluencerWeb.FetishControllerTest do
  use SwiftInfluencerWeb.ConnCase

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Fetish

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:fetish) do
    {:ok, fetish} = Twitter.create_fetish(@create_attrs)
    fetish
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tweeter_fetish", %{conn: conn} do
      conn = get(conn, Routes.fetish_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create fetish" do
    test "renders fetish when data is valid", %{conn: conn} do
      conn = post(conn, Routes.fetish_path(conn, :create), fetish: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.fetish_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.fetish_path(conn, :create), fetish: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update fetish" do
    setup [:create_fetish]

    test "renders fetish when data is valid", %{conn: conn, fetish: %Fetish{id: id} = fetish} do
      conn = put(conn, Routes.fetish_path(conn, :update, fetish), fetish: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.fetish_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, fetish: fetish} do
      conn = put(conn, Routes.fetish_path(conn, :update, fetish), fetish: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete fetish" do
    setup [:create_fetish]

    test "deletes chosen fetish", %{conn: conn, fetish: fetish} do
      conn = delete(conn, Routes.fetish_path(conn, :delete, fetish))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.fetish_path(conn, :show, fetish))
      end
    end
  end

  defp create_fetish(_) do
    fetish = fixture(:fetish)
    {:ok, fetish: fetish}
  end
end
