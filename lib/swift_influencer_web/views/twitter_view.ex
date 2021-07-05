defmodule SwiftInfluencerWeb.TwitterView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.TwitterView

  def render("index.json", %{twitters: twitters}) do
    %{data: render_many(twitters, TwitterView, "twitter.json")}
  end

  def render("show.json", %{twitter: twitter}) do
    %{data: render_one(twitter, TwitterView, "twitter.json")}
  end

  def render("twitter.json", %{twitter: twitter}) do
    %{id: twitter.id}
  end
end
