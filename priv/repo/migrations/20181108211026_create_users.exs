defmodule WeasleyClock.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :firebase_id, :string

      timestamps()
    end

  end
end
