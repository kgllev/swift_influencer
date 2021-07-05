defmodule SwiftInfluencerWeb.FriendsView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.FriendsView

  def render("index.json", %{friends: friends}) do
    %{data: render_many(friends, FriendsView, "friends.json")}
  end

  def render("show.json", %{friends: friends}) do
    %{data: render_one(friends, FriendsView, "friends.json")}
  end

  def render("friends.json", %{friends: friends}) do
    %{id: friends.id}
  end
end
