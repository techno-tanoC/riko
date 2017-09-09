# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :riko,
  ecto_repos: [Riko.Repo]

# Configures the endpoint
config :riko, RikoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QgKGilDo/YN12qvRCllI2lQs/EFDYVDP4w8KMS8/pyfZw1PcBvNuQHlya5Gnm69Z",
  render_errors: [view: RikoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Riko.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
