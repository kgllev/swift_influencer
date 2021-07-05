defmodule SwiftInfluencerWeb.UnfollowController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Unfollow

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    unfollows = Twitter.list_unfollows()
    render(conn, "index.json", unfollows: unfollows)
  end

  def create(conn, %{"unfollow" => unfollow_params}) do
    with {:ok, %Unfollow{} = unfollow} <- Twitter.create_unfollow(unfollow_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.unfollow_path(conn, :show, unfollow))
      |> render("show.json", unfollow: unfollow)
    end
  end

  def show(conn, %{"id" => id}) do
    unfollow = Twitter.get_unfollow!(id)
    render(conn, "show.json", unfollow: unfollow)
  end

  def update(conn, %{"id" => id, "unfollow" => unfollow_params}) do
    unfollow = Twitter.get_unfollow!(id)

    with {:ok, %Unfollow{} = unfollow} <- Twitter.update_unfollow(unfollow, unfollow_params) do
      render(conn, "show.json", unfollow: unfollow)
    end
  end

  def delete(conn, %{"id" => id}) do
    unfollow = Twitter.get_unfollow!(id)

    with {:ok, %Unfollow{}} <- Twitter.delete_unfollow(unfollow) do
      send_resp(conn, :no_content, "")
    end
  end
end
