defmodule SwiftInfluencerWeb.FetishView do
  use SwiftInfluencerWeb, :view
  alias SwiftInfluencerWeb.FetishView

  def render("index.json", %{tweeter_fetish: tweeter_fetish}) do
    %{data: render_many(tweeter_fetish, FetishView, "fetish.json")}
  end

  def render("show.json", %{fetish: fetish}) do
    %{data: render_one(fetish, FetishView, "fetish.json")}
  end

  def render("fetish.json", %{fetish: fetish}) do
    %{id: fetish.id}
  end
end
