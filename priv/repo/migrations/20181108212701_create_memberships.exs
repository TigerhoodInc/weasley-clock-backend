defmodule WeasleyClock.Repo.Migrations.CreateMemberships do
  use Ecto.Migration

  def change do
    create table(:memberships, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:user, on_delete: :nothing, type: :binary_id)
      add :group_id, references(:group, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:memberships, [:user_id])
    create index(:memberships, [:group_id])
  end
end
