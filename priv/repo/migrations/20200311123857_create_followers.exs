defmodule SwiftInfluencer.Repo.Migrations.CreateFollowers do
  use Ecto.Migration

  def change do
    create table(:followers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :followers, {:array, :map}
      timestamps()
    end

  end
end
