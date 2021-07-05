defmodule SwiftInfluencer.Twitter.Jobs.Algorithms.Influencer do
  alias SwiftInfluencer.Repo
  alias SwiftInfluencer.Twitter.Influencer
  use Timex
  import Ecto.Query
  alias ExTwitter

  def list() do
    {:ok, date} = DateTime.now("Etc/UTC")
    date = date
           |> Timex.to_datetime()
    query = from i in Influencer,
                 where: i.inserted_at >= ^Timex.beginning_of_day(date),
                 where: i.inserted_at <= ^Timex.end_of_day(date),
                 select: i.influencers
    [influencers] = Repo.all(query)
    influencers
  end

end