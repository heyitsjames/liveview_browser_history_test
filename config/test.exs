import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :browser_navigation_test, BrowserNavigationTest.Repo,
  username: "postgres",
  password: "postgres",
  database: "browser_navigation_test_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :browser_navigation_test, BrowserNavigationTestWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/HUX2EaoPWu/VU9ytj40+h6SxPi94ezxI5csTBPigKvdgG5FjOXL85rh1iJHq1xf",
  server: false

# In test we don't send emails.
config :browser_navigation_test, BrowserNavigationTest.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
