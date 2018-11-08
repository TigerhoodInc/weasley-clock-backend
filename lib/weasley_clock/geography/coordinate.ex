defmodule WeasleyClock.Geography.Coordinate do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "coordinates" do
    field :user_id, :binary_id
    field :location_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(coordinate, attrs) do
    coordinate
    |> cast(attrs, [])
    |> validate_required([])
  end
end
