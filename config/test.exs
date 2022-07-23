import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :longlink_web, LonglinkWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "LmMpbk/oHm0e796+sNKYawD0BZVBiQ/bQPmcX0zuCH1W7q1iWLwbpUz1dyALyqMH",
  server: false

config :longlink, ecto_repos: [Longlink.Repo]

config :longlink, Longlink.Repo,
  database: "test.db",
  pool: Ecto.Adapters.SQL.Sandbox

config :pbkdf2_elixir, :rounds, 1
