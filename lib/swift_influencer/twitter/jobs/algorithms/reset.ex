defmodule SwiftInfluencer.Twitter.Jobs.Algorithms.Reset do
  alias SwiftInfluencer.Twitter

  def reset do

  end
  def find_or_create_users() do

  end

  def find_or_create_friends() do
    friends = SwiftInfluencer.Twitter.Jobs.Generators.Friends.friends("the_p_plug")
    Enum.each(
      friends,
      fn friend ->
     # with{:ok, user} <- Twitter.
      end
    )
  end

  def find_or_create_followers() do
    followers = SwiftInfluencer.Twitter.Jobs.Generators.Followers.followers("the_p_plug")
  end
end