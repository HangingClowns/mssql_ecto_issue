use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ship_replication, ShipReplicationWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
host = System.get_env("AE_DB_HOST") || "localhost"
if host == "localhost" do
  config :ship_replication, ShipReplication.Repo,
    adapter: Ecto.Adapters.Postgres,
    database: "ship_replication_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox
else
  config :ship_replication, ShipReplication.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: "postgres",
    password: "postgres",
    database: "ship_replication_test",
    hostname: host,
    pool: Ecto.Adapters.SQL.Sandbox
end