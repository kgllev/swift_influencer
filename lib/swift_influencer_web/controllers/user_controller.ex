defmodule SwiftInfluencerWeb.UserController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.User

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    tweeter_users = Twitter.list_tweeter_users()
    render(conn, "index.json", tweeter_users: tweeter_users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Twitter.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Twitter.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Twitter.get_user!(id)

    with {:ok, %User{} = user} <- Twitter.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Twitter.get_user!(id)

    with {:ok, %User{}} <- Twitter.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
