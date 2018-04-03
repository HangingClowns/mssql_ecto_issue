# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ship_replication,
  ecto_repos: [ShipReplication.Repo]

# Configures the endpoint
config :ship_replication, ShipReplicationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1PV/NbudleAr/fbmjDSglIAKHYCZ86/5LThwMriWANmCjtyKuRCPe6fFB1RVQ61d",
  render_errors: [view: ShipReplicationWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ShipReplication.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
