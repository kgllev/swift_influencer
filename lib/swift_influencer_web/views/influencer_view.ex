defmodule SwiftInfluencerWeb.InfluencerView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.InfluencerView

  def render("index.json", %{influencers: influencers}) do
    %{data: render_many(influencers, InfluencerView, "influencer.json")}
  end

  def render("show.json", %{influencer: influencer}) do
    %{data: render_one(influencer, InfluencerView, "influencer.json")}
  end

  def render("influencer.json", %{influencer: influencer}) do
    %{id: influencer.id}
  end
end
