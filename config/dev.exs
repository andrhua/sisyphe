use Mix.Config

config :sisyphe, Sisyphe.Repo,
  database: Path.expand("../priv/data.db", __DIR__)

config :sisyphe,
  bureau_webhook: "http://localhost:9000/papers"

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :sisyphe, SisypheWeb.Endpoint,
  http: [port: 8000],
  # https: [
  #   port: 8000,
  #   cipher_suite: :strong,
  #   certfile: "priv/cert/selfsigned.pem",
  #   keyfile: "priv/cert/selfsigned_key.pem"
  # ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Watch static and templates for browser reloading.
config :sisyphe, SisypheWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/sisyphe_web/(live|views)/.*(ex)$",
      ~r"lib/sisyphe_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
