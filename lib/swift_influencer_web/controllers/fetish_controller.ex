  defmodule SwiftInfluencerWeb.FetishController do
  use SwiftInfluencerWeb, :controller

  alias SwiftInfluencer.Twitter
  alias SwiftInfluencer.Twitter.Fetish

  action_fallback SwiftInfluencerWeb.FallbackController

  def index(conn, _params) do
    tweeter_fetish = Twitter.list_tweeter_fetish()
    render(conn, "index.json", tweeter_fetish: tweeter_fetish)
  end

  def create(conn, %{"fetish" => fetish_params}) do
    with {:ok, %Fetish{} = fetish} <- Twitter.create_fetish(fetish_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.fetish_path(conn, :show, fetish))
      |> render("show.json", fetish: fetish)
    end
  end

  def show(conn, %{"id" => id}) do
    fetish = Twitter.get_fetish!(id)
    render(conn, "show.json", fetish: fetish)
  end

  def update(conn, %{"id" => id, "fetish" => fetish_params}) do
    fetish = Twitter.get_fetish!(id)

    with {:ok, %Fetish{} = fetish} <- Twitter.update_fetish(fetish, fetish_params) do
      render(conn, "show.json", fetish: fetish)
    end
  end

  def delete(conn, %{"id" => id}) do
    fetish = Twitter.get_fetish!(id)

    with {:ok, %Fetish{}} <- Twitter.delete_fetish(fetish) do
      send_resp(conn, :no_content, "")
    end
  end
end
