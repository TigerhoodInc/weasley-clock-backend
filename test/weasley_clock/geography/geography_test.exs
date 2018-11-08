defmodule WeasleyClock.GeographyTest do
  use WeasleyClock.DataCase

  alias WeasleyClock.Geography

  describe "locations" do
    alias WeasleyClock.Geography.Location

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geography.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Geography.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Geography.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Geography.create_location(@valid_attrs)
      assert location.name == "some name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geography.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Geography.update_location(location, @update_attrs)
      assert location.name == "some updated name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Geography.update_location(location, @invalid_attrs)
      assert location == Geography.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Geography.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Geography.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Geography.change_location(location)
    end
  end

  describe "coordinates" do
    alias WeasleyClock.Geography.Coordinate

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def coordinate_fixture(attrs \\ %{}) do
      {:ok, coordinate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geography.create_coordinate()

      coordinate
    end

    test "list_coordinates/0 returns all coordinates" do
      coordinate = coordinate_fixture()
      assert Geography.list_coordinates() == [coordinate]
    end

    test "get_coordinate!/1 returns the coordinate with given id" do
      coordinate = coordinate_fixture()
      assert Geography.get_coordinate!(coordinate.id) == coordinate
    end

    test "create_coordinate/1 with valid data creates a coordinate" do
      assert {:ok, %Coordinate{} = coordinate} = Geography.create_coordinate(@valid_attrs)
    end

    test "create_coordinate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geography.create_coordinate(@invalid_attrs)
    end

    test "update_coordinate/2 with valid data updates the coordinate" do
      coordinate = coordinate_fixture()
      assert {:ok, %Coordinate{} = coordinate} = Geography.update_coordinate(coordinate, @update_attrs)
    end

    test "update_coordinate/2 with invalid data returns error changeset" do
      coordinate = coordinate_fixture()
      assert {:error, %Ecto.Changeset{}} = Geography.update_coordinate(coordinate, @invalid_attrs)
      assert coordinate == Geography.get_coordinate!(coordinate.id)
    end

    test "delete_coordinate/1 deletes the coordinate" do
      coordinate = coordinate_fixture()
      assert {:ok, %Coordinate{}} = Geography.delete_coordinate(coordinate)
      assert_raise Ecto.NoResultsError, fn -> Geography.get_coordinate!(coordinate.id) end
    end

    test "change_coordinate/1 returns a coordinate changeset" do
      coordinate = coordinate_fixture()
      assert %Ecto.Changeset{} = Geography.change_coordinate(coordinate)
    end
  end
end
