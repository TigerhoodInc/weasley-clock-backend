defmodule WeasleyClockWeb.CoordinateView do
  use WeasleyClockWeb, :view
  alias WeasleyClockWeb.CoordinateView

  def render("index.json", %{coordinates: coordinates}) do
    %{data: render_many(coordinates, CoordinateView, "coordinate.json")}
  end

  def render("show.json", %{coordinate: coordinate}) do
    %{data: render_one(coordinate, CoordinateView, "coordinate.json")}
  end

  def render("coordinate.json", %{coordinate: coordinate}) do
    %{id: coordinate.id}
  end
end
