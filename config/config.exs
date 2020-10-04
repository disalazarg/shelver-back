# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :shelver_web,
  generators: [context_app: :shelver]

# Configures the endpoint
config :shelver_web, ShelverWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MI88121iUTZZ3seoP4AmgDOJvSUZZGez11Oo9X/rqG0olZTYcFuL3Byn4RVOgGeS",
  render_errors: [view: ShelverWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Shelver.PubSub,
  live_view: [signing_salt: "enuWszoB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
