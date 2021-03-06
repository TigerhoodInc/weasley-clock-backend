defmodule WeasleyClockWeb.Router do
  use WeasleyClockWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WeasleyClockWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit, :delete]
    resources "/groups", GroupController, except: [:create, :edit]
    resources "/memberships", MembershipController, only: [:create]
  end
end
