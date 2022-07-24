# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :longlink_web,
  generators: [context_app: false]

# Configures the endpoint
config :longlink_web, LonglinkWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: LonglinkWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LonglinkWeb.PubSub,
  live_view: [signing_salt: "DvOgoS5F"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/longlink_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :longlink, ecto_repos: [Longlink.Repo]
config :longlink, Longlink.Repo, database: "db/longlink.db"

config :tailwind,
  version: "3.1.4",
  default: [
    args: ~w(
    --config=tailwind.config.js
    --input=../priv/static/assets/app.tailwind.css
    --output=../priv/static/assets/app.css
  ),
    cd: Path.expand("../apps/longlink_web/assets", __DIR__)
  ]

config :dart_sass, version: "1.49.11"

config :dart_sass,
  version: "1.49.11",
  default: [
    args: ~w(css/app.scss ../priv/static/assets/app.tailwind.css),
    cd: Path.expand("../apps/longlink_web/assets", __DIR__)
  ]

# https://github.com/cogini/mix_systemd#configuration-options
config :mix_systemd,
  app_user: "longlink",
  app_group: "longlink",
  base_dir: "/opt",
  deploy_dir: "/opt/longlink",
  env_vars: [
    "PORT=4000",
  ]
