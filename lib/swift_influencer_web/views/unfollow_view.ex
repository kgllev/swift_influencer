defmodule SwiftInfluencerWeb.UnfollowView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.UnfollowView

  def render("index.json", %{unfollows: unfollows}) do
    %{data: render_many(unfollows, UnfollowView, "unfollow.json")}
  end

  def render("show.json", %{unfollow: unfollow}) do
    %{data: render_one(unfollow, UnfollowView, "unfollow.json")}
  end

  def render("unfollow.json", %{unfollow: unfollow}) do
    %{id: unfollow.id}
  end
end
