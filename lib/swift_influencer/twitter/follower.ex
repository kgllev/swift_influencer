defmodule SwiftInfluencer.Twitter.Follower do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "followers" do
    field :followers, {:array, :map}
    timestamps()
  end

  @doc false
  def changeset(follower, attrs) do
    follower
    |> cast(attrs, [:followers])
    |> validate_required([:followers])
  end
end
