defmodule SwiftInfluencerWeb.FavoriteView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.FavoriteView

  def render("index.json", %{favorites: favorites}) do
    %{data: render_many(favorites, FavoriteView, "favorite.json")}
  end

  def render("show.json", %{favorite: favorite}) do
    %{data: render_one(favorite, FavoriteView, "favorite.json")}
  end

  def render("favorite.json", %{favorite: favorite}) do
    %{id: favorite.id}
  end
end
