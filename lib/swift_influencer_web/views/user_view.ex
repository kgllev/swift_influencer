defmodule SwiftInfluencerWeb.UserView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.UserView

  def render("index.json", %{tweeter_users: tweeter_users}) do
    %{data: render_many(tweeter_users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id}
  end
end
