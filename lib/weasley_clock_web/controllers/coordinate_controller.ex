defmodule WeasleyClockWeb.CoordinateController do
  use WeasleyClockWeb, :controller

  alias WeasleyClock.Geography
  alias WeasleyClock.Geography.Coordinate

  action_fallback WeasleyClockWeb.FallbackController

  def index(conn, _params) do
    coordinates = Geography.list_coordinates()
    render(conn, "index.json", coordinates: coordinates)
  end

  def create(conn, %{"coordinate" => coordinate_params}) do
    with {:ok, %Coordinate{} = coordinate} <- Geography.create_coordinate(coordinate_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.coordinate_path(conn, :show, coordinate))
      |> render("show.json", coordinate: coordinate)
    end
  end

  def show(conn, %{"id" => id}) do
    coordinate = Geography.get_coordinate!(id)
    render(conn, "show.json", coordinate: coordinate)
  end

  def update(conn, %{"id" => id, "coordinate" => coordinate_params}) do
    coordinate = Geography.get_coordinate!(id)

    with {:ok, %Coordinate{} = coordinate} <- Geography.update_coordinate(coordinate, coordinate_params) do
      render(conn, "show.json", coordinate: coordinate)
    end
  end

  def delete(conn, %{"id" => id}) do
    coordinate = Geography.get_coordinate!(id)

    with {:ok, %Coordinate{}} <- Geography.delete_coordinate(coordinate) do
      send_resp(conn, :no_content, "")
    end
  end
end
