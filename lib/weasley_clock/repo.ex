defmodule WeasleyClock.Repo do
  use Ecto.Repo,
    otp_app: :weasley_clock,
    adapter: Ecto.Adapters.Postgres
end
