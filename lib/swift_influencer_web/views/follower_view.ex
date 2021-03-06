defmodule SwiftInfluencerWeb.FollowerView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.FollowerView

  def render("index.json", %{followers: followers}) do
    %{data: render_many(followers, FollowerView, "follower.json")}
  end

  def render("show.json", %{follower: follower}) do
    %{data: render_one(follower, FollowerView, "follower.json")}
  end

  def render("follower.json", %{follower: follower}) do
    %{id: follower.id}
  end
end
