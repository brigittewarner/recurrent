# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :recurrent,
  ecto_repos: [Recurrent.Repo]

# Configures the endpoint
config :recurrent, Recurrent.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SfvLKd21dw2AAjedp9Rj7BjXlh9j2jwkDX1mTibmGjg5djVyuyBKYwdkg3BHKSN6",
  render_errors: [view: Recurrent.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Recurrent.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Recurrent",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("guardian_secret"),
  serializer: Recurrent.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
