defmodule SwiftInfluencer.Twitter.Jobs.Algorithms.User do
  alias SwiftInfluencer.Twitter.Jobs.Algorithms.Influencer
  alias SwiftInfluencer.Twitter

  def store_users do
    influencers = Influencer.list()
    if Enum.count(influencers) > 0 do
      Enum.map(
        influencers,
        fn influencer ->
        IO.inspect influencer
          followers = SwiftInfluencer.Twitter.Jobs.Generators.Followers.followers(influencer)
          IO.inspect followers
          if Enum.count(followers) > 0 do
            Enum.map(
              followers,
              fn follower ->
              IO.inspect follower
                with{:ok, :not_found} <- check_if_user_exists(follower) do
                  Twitter.create_user(%{screen_id: follower})
                end
              end
            )
          else
            raise "This user has no followers! "
          end
        end
      )
    end
  end

  def check_if_user_exists(screen_name) do
    {:ok, :not_found}
  end

end