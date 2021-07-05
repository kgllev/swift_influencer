# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :extwitter, :oauth, [
  consumer_key: "rgW8PBo4KBHOx8CYxjiRuSMTi",
  consumer_secret: "vk1thp9YeozZ79U93nuhA1rY1vPCTw2muQHKMLQNNeymwhgQ8s",
  access_token: "1225042088221446144-FnEnINvOLfhhNBHurK7RnrwjKlzSiw",
  access_token_secret: "Zf90yYngHdUYn6MBOW9oylv8ECODDSl8NdxM5PhuLaT88"
]



config :swift_influencer,
       ecto_repos: [SwiftInfluencer.Repo],
       generators: [
         binary_id: true
       ]

config :swift_influencer,
       SwiftInfluencer.Twitter.Scheduler.Scheduler,
       jobs: [
         tweeter_follow: [
           schedule: "*/3 * * * *",
           task: {SwiftInfluencer.Twitter.Jobs.Algorithms.Follow, :follow, [Enum.random(3..10)]}
         ],
         tweeter_unfollow: [
           schedule: "*/2 * * * *",
           task: {SwiftInfluencer.Twitter.Jobs.Algorithms.Unfollow, :unfollow, [Enum.random(3..6)]}
         ],
#         tweeter_follow_back: [
#           scheduule: "*/60 * * * *",
#           task: {SwiftInfluencer.Twitter.Jobs.Generators.FollowbackList, :list, [1, "leila_lesenya"]}
#         ]

         #update haystack
         #         refresh_follow_bucket: [
         #         schedule: "*/ * * * *"
         #         ]

       ]

#Configures the endpoint
config :swift_influencer,
       SwiftInfluencerWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "KuHfDjeTLbaYw6Dr16Iqam2HdWlmiL7nMFuB7hTDypAf1dLQxrOYvyXBOebQEZRv",
       render_errors: [
         view: SwiftInfluencerWeb.ErrorView,
         accepts: ~w(json)
       ],
       pubsub: [
         name: SwiftInfluencer.PubSub,
         adapter: Phoenix.PubSub.PG2
       ],
       live_view: [
         signing_salt: "lvP3V4rQ"
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
