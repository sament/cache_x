# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cache_x,
  ecto_repos: [CacheX.Repo]

# Configures the endpoint
config :cache_x, CacheXWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mHyZnF8JZbdzUo8zy1r1uWw232Nr+o0bEDO6lPp5GFBbmsj/aoIQU5bRXhpjkNpE",
  render_errors: [view: CacheXWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CacheX.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
