use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :weasley_clock, WeasleyClockWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :weasley_clock, WeasleyClock.Repo,
  username: "postgres",
  password: "cgwutwut",
  database: "weasley_clock_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
