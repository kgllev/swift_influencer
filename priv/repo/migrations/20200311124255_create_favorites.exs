defmodule SwiftInfluencer.Repo.Migrations.CreateFavorites do
  use Ecto.Migration

  def change do
    create table(:favorites, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :favorites, {:array, :map}
      timestamps()
    end

  end
end
