defmodule SwiftInfluencer.Twitter.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tweeter_users" do
    field :screen_id, :integer
    field :screen_name, :string
    field :location, :string
    field :fetish, {:array, :string}
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:screen_id, :screen_name, :location, :fetish])
    |> validate_required([:screen_id])
  end
end
