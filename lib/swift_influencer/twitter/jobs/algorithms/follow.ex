defmodule SwiftInfluencer.Twitter.Jobs.Algorithms.Follow do
  alias SwiftInfluencer.Twitter.Jobs.Generators.FollowList
  alias SwiftInfluencer.Twitter
  alias ExTwitter

  def follow(number) do
    users = Enum.take(FollowList.list(), number)
    Enum.each(
      users,
      fn user ->
        try do
          ExTwitter.follow(user)
        rescue
          _ ->
            :nothing
        end
        Twitter.create_follow(%{screen_id: user})
      end
    )
  end
end