defmodule SwiftInfluencer.Repo.Migrations.CreateTweeterUsers do
  use Ecto.Migration

  def change do
    create table(:tweeter_users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :screen_id, :bigserial
      add :screen_name, :string, null: true
      add :location, :string, null: true
      add :fetish, {:array, :integer}, null: true
      timestamps()
    end

  end
end
