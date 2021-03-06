defmodule WeasleyClockWeb.GroupController do
  use WeasleyClockWeb, :controller

  alias WeasleyClock.Accounts
  alias WeasleyClock.Accounts.Group

  action_fallback WeasleyClockWeb.FallbackController

  def index(conn, _params) do
    groups = Accounts.list_groups()
    render(conn, "index.json", groups: groups)
  end

  def create(conn, %{"group" => group_params}) do
    with {:ok, %Group{} = group} <- Accounts.create_group(group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.group_path(conn, :show, group))
      |> render("show.json", group: group)
    end
  end

  def show(conn, %{"id" => id}) do
    group = Accounts.get_group!(id)
    render(conn, "show.json", group: group)
  end

  def update(conn, %{"id" => id, "group" => group_params}) do
    group = Accounts.get_group!(id)

    with {:ok, %Group{} = group} <- Accounts.update_group(group, group_params) do
      render(conn, "show.json", group: group)
    end
  end

  def delete(conn, %{"id" => id}) do
    group = Accounts.get_group!(id)

    with {:ok, %Group{}} <- Accounts.delete_group(group) do
      send_resp(conn, :no_content, "")
    end
  end
end
