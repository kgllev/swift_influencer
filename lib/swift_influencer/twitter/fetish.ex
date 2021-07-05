defmodule SwiftInfluencer.Twitter.Fetish do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tweeter_fetish" do

    timestamps()
  end

  @doc false
  def changeset(fetish, attrs) do
    fetish
    |> cast(attrs, [])
    |> validate_required([])
  end
end
