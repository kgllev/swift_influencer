defmodule SwiftInfluencer.Repo.Migrations.CreateInfluencers do
  use Ecto.Migration

  def change do
    create table(:influencers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :influencers, {:array, :string}
      timestamps()
    end

  end
end
