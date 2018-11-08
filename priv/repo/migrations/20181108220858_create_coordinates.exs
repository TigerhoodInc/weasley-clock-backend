defmodule WeasleyClock.Repo.Migrations.CreateCoordinates do
  use Ecto.Migration

  def change do
    create table(:coordinates, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :location_id, references(:locations, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:coordinates, [:user_id])
    create index(:coordinates, [:location_id])
  end
end
