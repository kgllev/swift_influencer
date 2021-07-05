defmodule SwiftInfluencer.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :comments, {:array, :map}
      timestamps()
    end

  end
end
