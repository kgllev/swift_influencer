defmodule SwiftInfluencerWeb.Router do
  use SwiftInfluencerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SwiftInfluencerWeb do
    pipe_through :api
  end
end
