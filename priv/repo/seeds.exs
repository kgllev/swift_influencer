#mac_shad
#OLANREFRONT247
# "Oma_Twits"
%SwiftInfluencer.Twitter.Influencer{}
|> SwiftInfluencer.Twitter.Influencer.changeset(
     %{influencers: ["Achieng_ke"]}
   )
|> SwiftInfluencer.Repo.insert!

followers = SwiftInfluencer.Twitter.Jobs.Generators.Followers.followers("leila_lesedi")
friends   = SwiftInfluencer.Twitter.Jobs.Generators.Friends.friends("leila_lesedi")

Enum.map(
friends,
  fn item ->
    %SwiftInfluencer.Twitter.Friends{}
    |> SwiftInfluencer.Twitter.Friends.changeset(%{screen_id: item})
    |> SwiftInfluencer.Repo.insert!
  end
)
Enum.map(
  followers,
  fn item ->
    %SwiftInfluencer.Twitter.Follow{}
    |> SwiftInfluencer.Twitter.Follow.changeset(%{screen_id: item})
    |> SwiftInfluencer.Repo.insert!
  end
)

SwiftInfluencer.Twitter.Jobs.Algorithms.User.store_users()



#Jobs =>
