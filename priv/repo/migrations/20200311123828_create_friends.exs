defmodule SwiftInfluencer.Repo.Migrations.CreateFriends do
  use Ecto.Migration

  def change do
    create table(:friends, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :screen_id, :bigserial
      timestamps()
    end
  end
end
