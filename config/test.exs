import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bomb, BombWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "nuoAeAeK+/h6rMVGIiHxvIFS4/cLZ7GDs7EqWJV3lWvv/9i6jf6yavNeH8R5cG5B",
  server: false

# In test we don't send emails.
config :bomb, Bomb.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
