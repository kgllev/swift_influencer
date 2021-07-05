defmodule SwiftInfluencer.Repo do
  use Ecto.Repo,
    otp_app: :swift_influencer,
    adapter: Ecto.Adapters.Postgres
end
