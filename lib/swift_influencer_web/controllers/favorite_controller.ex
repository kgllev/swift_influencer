defmodule SwiftInfluencerWeb.FavoriteController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Favorite

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    favorites = Twitter.list_favorites()
    render(conn, "index.json", favorites: favorites)
  end

  def create(conn, %{"favorite" => favorite_params}) do
    with {:ok, %Favorite{} = favorite} <- Twitter.create_favorite(favorite_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.favorite_path(conn, :show, favorite))
      |> render("show.json", favorite: favorite)
    end
  end

  def show(conn, %{"id" => id}) do
    favorite = Twitter.get_favorite!(id)
    render(conn, "show.json", favorite: favorite)
  end

  def update(conn, %{"id" => id, "favorite" => favorite_params}) do
    favorite = Twitter.get_favorite!(id)

    with {:ok, %Favorite{} = favorite} <- Twitter.update_favorite(favorite, favorite_params) do
      render(conn, "show.json", favorite: favorite)
    end
  end

  def delete(conn, %{"id" => id}) do
    favorite = Twitter.get_favorite!(id)

    with {:ok, %Favorite{}} <- Twitter.delete_favorite(favorite) do
      send_resp(conn, :no_content, "")
    end
  end
end
