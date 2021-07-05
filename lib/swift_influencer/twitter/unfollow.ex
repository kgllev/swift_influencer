defmodule SwiftInfluencer.Twitter.Unfollow do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "unfollows" do
    field :screen_id, :integer
    timestamps()
  end

  @doc false
  def changeset(unfollow, attrs) do
    unfollow
    |> cast(attrs, [:screen_id])
    |> validate_required([:screen_id])
  end
end
