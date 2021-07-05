defmodule SwiftInfluencer.Twitter.Jobs.Algorithms.Unfollow do
  alias SwiftInfluencer.Twitter.Jobs.Generators.UnfollowList
  alias ExTwitter
  alias SwiftInfluencer.Twitter


  def unfollow(count) do
    list = Enum.take(UnfollowList.list(), count)
    Enum.each(
      list,
      fn user ->
        try do
          ExTwitter.unfollow(user)
        rescue
          _ ->
            :nothing_unfollowed
        end
        Twitter.create_unfollow(%{screen_id: user})
      end
    )
  end
end