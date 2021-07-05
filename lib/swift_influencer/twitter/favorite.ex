defmodule SwiftInfluencer.Twitter.Favorite do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "favorites" do
    field :favorites, {:array, :map}
    timestamps()
  end

  @doc false
  def changeset(favorite, attrs) do
    favorite
    |> cast(attrs, [:favorites])
    |> validate_required([:favorites])
  end
end
