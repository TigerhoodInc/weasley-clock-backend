defmodule WeasleyClock.Geography do
  @moduledoc """
  The Geography context.
  """

  import Ecto.Query, warn: false
  alias WeasleyClock.Repo

  alias WeasleyClock.Geography.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{source: %Location{}}

  """
  def change_location(%Location{} = location) do
    Location.changeset(location, %{})
  end

  alias WeasleyClock.Geography.Coordinate

  @doc """
  Returns the list of coordinates.

  ## Examples

      iex> list_coordinates()
      [%Coordinate{}, ...]

  """
  def list_coordinates do
    Repo.all(Coordinate)
  end

  @doc """
  Gets a single coordinate.

  Raises `Ecto.NoResultsError` if the Coordinate does not exist.

  ## Examples

      iex> get_coordinate!(123)
      %Coordinate{}

      iex> get_coordinate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coordinate!(id), do: Repo.get!(Coordinate, id)

  @doc """
  Creates a coordinate.

  ## Examples

      iex> create_coordinate(%{field: value})
      {:ok, %Coordinate{}}

      iex> create_coordinate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coordinate(attrs \\ %{}) do
    %Coordinate{}
    |> Coordinate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coordinate.

  ## Examples

      iex> update_coordinate(coordinate, %{field: new_value})
      {:ok, %Coordinate{}}

      iex> update_coordinate(coordinate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coordinate(%Coordinate{} = coordinate, attrs) do
    coordinate
    |> Coordinate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Coordinate.

  ## Examples

      iex> delete_coordinate(coordinate)
      {:ok, %Coordinate{}}

      iex> delete_coordinate(coordinate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coordinate(%Coordinate{} = coordinate) do
    Repo.delete(coordinate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coordinate changes.

  ## Examples

      iex> change_coordinate(coordinate)
      %Ecto.Changeset{source: %Coordinate{}}

  """
  def change_coordinate(%Coordinate{} = coordinate) do
    Coordinate.changeset(coordinate, %{})
  end
end
