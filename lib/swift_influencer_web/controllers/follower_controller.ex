defmodule SwiftInfluencerWeb.FollowerController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Follower

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    followers = Twitter.list_followers()
    render(conn, "index.json", followers: followers)
  end

  def create(conn, %{"follower" => follower_params}) do
    with {:ok, %Follower{} = follower} <- Twitter.create_follower(follower_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.follower_path(conn, :show, follower))
      |> render("show.json", follower: follower)
    end
  end

  def show(conn, %{"id" => id}) do
    follower = Twitter.get_follower!(id)
    render(conn, "show.json", follower: follower)
  end

  def update(conn, %{"id" => id, "follower" => follower_params}) do
    follower = Twitter.get_follower!(id)

    with {:ok, %Follower{} = follower} <- Twitter.update_follower(follower, follower_params) do
      render(conn, "show.json", follower: follower)
    end
  end

  def delete(conn, %{"id" => id}) do
    follower = Twitter.get_follower!(id)

    with {:ok, %Follower{}} <- Twitter.delete_follower(follower) do
      send_resp(conn, :no_content, "")
    end
  end
end
