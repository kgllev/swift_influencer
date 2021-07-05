defmodule SwiftInfluencer.Twitter.Influencer do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "influencers" do
    field :influencers, {:array, :string}
    timestamps()
  end

  @doc false
  def changeset(influencer, attrs) do
    influencer
    |> cast(attrs, [:influencers])
    |> validate_required([:influencers])
  end
end
