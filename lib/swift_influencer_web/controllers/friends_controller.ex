defmodule SwiftInfluencerWeb.FriendsController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Friends

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    friends = Twitter.list_friends()
    render(conn, "index.json", friends: friends)
  end

  def create(conn, %{"friends" => friends_params}) do
    with {:ok, %Friends{} = friends} <- Twitter.create_friends(friends_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.friends_path(conn, :show, friends))
      |> render("show.json", friends: friends)
    end
  end

  def show(conn, %{"id" => id}) do
    friends = Twitter.get_friends!(id)
    render(conn, "show.json", friends: friends)
  end

  def update(conn, %{"id" => id, "friends" => friends_params}) do
    friends = Twitter.get_friends!(id)

    with {:ok, %Friends{} = friends} <- Twitter.update_friends(friends, friends_params) do
      render(conn, "show.json", friends: friends)
    end
  end

  def delete(conn, %{"id" => id}) do
    friends = Twitter.get_friends!(id)

    with {:ok, %Friends{}} <- Twitter.delete_friends(friends) do
      send_resp(conn, :no_content, "")
    end
  end
end
