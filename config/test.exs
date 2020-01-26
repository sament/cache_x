use Mix.Config

# Configure your database
config :cache_x, CacheX.Repo,
  username: "postgres",
  password: "postgres",
  database: "cache_x_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cache_x, CacheXWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
