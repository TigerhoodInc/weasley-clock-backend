defmodule WeasleyClockWeb.Router do
  use WeasleyClockWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WeasleyClockWeb do
    pipe_through :api
  end
end
