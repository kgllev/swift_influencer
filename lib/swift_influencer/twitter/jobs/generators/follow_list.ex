defmodule SwiftInfluencer.Twitter.Jobs.Generators.FollowList do
  alias SwiftInfluencer.Twitter.Jobs.Algorithms.Tweet
  alias SwiftInfluencer.Twitter.Jobs.Algorithms.Influencer
  alias SwiftInfluencer.Twitter.Jobs.Generators.UnfollowList
  alias SwiftInfluencer.Repo
  import Ecto.Query

  def list do
    list = users() -- follows()
    list = list -- previously_followed_then_un_followed()
    list = list -- UnfollowList.list()
  end

  def follows do
    query = from f in "follows",
                 select: f.screen_id
    follows = Repo.all(query)
    follows
  end

  def users do
    query = from u in "tweeter_users",
                 order_by: fragment("RANDOM()"),
                 limit: 100,
                 select: u.screen_id
    users = Repo.all(query)
    users
  end

  def previously_followed_then_un_followed do
    query = from u in "unfollows",
                 select: u.screen_id
    users = Repo.all(query)
    users
  end
end