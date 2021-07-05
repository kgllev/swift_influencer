defmodule SwiftInfluencerWeb.InfluencerControllerTest do
  use SwiftInfluencerWeb.ConnCase

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Influencer

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:influencer) do
    {:ok, influencer} = Twitter.create_influencer(@create_attrs)
    influencer
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all influencers", %{conn: conn} do
      conn = get(conn, Routes.influencer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create influencer" do
    test "renders influencer when data is valid", %{conn: conn} do
      conn = post(conn, Routes.influencer_path(conn, :create), influencer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.influencer_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.influencer_path(conn, :create), influencer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update influencer" do
    setup [:create_influencer]

    test "renders influencer when data is valid", %{conn: conn, influencer: %Influencer{id: id} = influencer} do
      conn = put(conn, Routes.influencer_path(conn, :update, influencer), influencer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.influencer_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, influencer: influencer} do
      conn = put(conn, Routes.influencer_path(conn, :update, influencer), influencer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete influencer" do
    setup [:create_influencer]

    test "deletes chosen influencer", %{conn: conn, influencer: influencer} do
      conn = delete(conn, Routes.influencer_path(conn, :delete, influencer))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.influencer_path(conn, :show, influencer))
      end
    end
  end

  defp create_influencer(_) do
    influencer = fixture(:influencer)
    {:ok, influencer: influencer}
  end
end
