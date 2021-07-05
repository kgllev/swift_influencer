defmodule SwiftInfluencer.Twitter.Jobs.Generators.UnfollowList do
  alias SwiftInfluencer.Repo
  import Ecto.Query

  def list do
    list = friends() -- followers()
    list -- unfollowed()
  end
  def followers do
    query = from f in "follows",
                 select: f.screen_id
    followers = Repo.all(query)
    followers
  end
  def friends do
    query = from f in "friends",
                 select: f.screen_id
    friends = Repo.all(query)
    friends
  end
  def unfollowed do
    query   =   from u in "unfollows",
    select: u.screen_id
    unfollowed = Repo.all(query)
  end
end