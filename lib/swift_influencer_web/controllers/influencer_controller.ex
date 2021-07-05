defmodule SwiftInfluencerWeb.InfluencerController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Influencer

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    influencers = Twitter.list_influencers()
    render(conn, "index.json", influencers: influencers)
  end

  def create(conn, %{"influencer" => influencer_params}) do
    with {:ok, %Influencer{} = influencer} <- Twitter.create_influencer(influencer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.influencer_path(conn, :show, influencer))
      |> render("show.json", influencer: influencer)
    end
  end

  def show(conn, %{"id" => id}) do
    influencer = Twitter.get_influencer!(id)
    render(conn, "show.json", influencer: influencer)
  end

  def update(conn, %{"id" => id, "influencer" => influencer_params}) do
    influencer = Twitter.get_influencer!(id)

    with {:ok, %Influencer{} = influencer} <- Twitter.update_influencer(influencer, influencer_params) do
      render(conn, "show.json", influencer: influencer)
    end
  end

  def delete(conn, %{"id" => id}) do
    influencer = Twitter.get_influencer!(id)

    with {:ok, %Influencer{}} <- Twitter.delete_influencer(influencer) do
      send_resp(conn, :no_content, "")
    end
  end
end
