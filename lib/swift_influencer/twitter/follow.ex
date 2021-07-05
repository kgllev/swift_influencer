defmodule SwiftInfluencer.Twitter.Follow do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "follows" do
    field :screen_id, :integer
    timestamps()
  end

  @doc false
  def changeset(follow, attrs) do
    follow
    |> cast(attrs, [:screen_id])
    |> validate_required([:screen_id])
  end
end
