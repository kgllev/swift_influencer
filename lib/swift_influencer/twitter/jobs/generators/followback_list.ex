defmodule SwiftInfluencer.Twitter.Jobs.Generators.FollowbackList do
  alias SwiftInfluencer.Twitter.Jobs.Generators.Friends
  alias SwiftInfluencer.Twitter.Jobs.Generators.Followers

  def list(number, screen_name) do
    #my followers who are not my friends
    Enum.each(
      Enum.take(Followers.followers(screen_name) -- Friends.friends(screen_name), number),
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