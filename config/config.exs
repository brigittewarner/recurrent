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

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Recurrent.User,
  repo: Recurrent.Repo,
  module: Recurrent,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable, :confirmable]

config :coherence, Recurrent.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
