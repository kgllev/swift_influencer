defmodule SwiftInfluencerWeb.FollowController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Follow

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    follows = Twitter.list_follows()
    render(conn, "index.json", follows: follows)
  end

  def create(conn, %{"follow" => follow_params}) do
    with {:ok, %Follow{} = follow} <- Twitter.create_follow(follow_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.follow_path(conn, :show, follow))
      |> render("show.json", follow: follow)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = Twitter.get_follow!(id)
    render(conn, "show.json", follow: follow)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = Twitter.get_follow!(id)

    with {:ok, %Follow{} = follow} <- Twitter.update_follow(follow, follow_params) do
      render(conn, "show.json", follow: follow)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = Twitter.get_follow!(id)

    with {:ok, %Follow{}} <- Twitter.delete_follow(follow) do
      send_resp(conn, :no_content, "")
    end
  end
end
