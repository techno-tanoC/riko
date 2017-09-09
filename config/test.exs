use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :riko, RikoWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :riko, Riko.Repo,
  adapter: Sqlite.Ecto2,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "test.db"
