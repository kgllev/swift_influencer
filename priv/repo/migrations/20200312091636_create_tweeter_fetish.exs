defmodule SwiftInfluencer.Repo.Migrations.CreateTweeterFetish do
  use Ecto.Migration

  def change do
    create table(:tweeter_fetish, primary_key: false) do
      add :id, :binary_id, primary_key: true

      timestamps()
    end

  end
end
