# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :location_routing, LocationRoutingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "N4jWOliwf//G9lIUHG51iOvfGYnXhB76l2JrV/13B8c0Hm0Xz77xMsF3dbRUSqgP",
  render_errors: [view: LocationRoutingWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: LocationRouting.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
