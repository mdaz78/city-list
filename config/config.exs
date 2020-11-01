# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cities,
  ecto_repos: [Cities.Repo]

# Configures the endpoint
config :cities, CitiesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cTj2QTmczOv7B2TPbY0US9NUxWOZpD/SPAkZ2Lt5vKU6/SjxjM7B03kWd70a/EZ6",
  render_errors: [view: CitiesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cities.PubSub,
  live_view: [signing_salt: "hAeFSzYC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
