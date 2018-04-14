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
    adapter: MssqlEcto,
    database: "ship_replication_test",
    username: "sa",
    password: "reallyStrongPwd123",
    hostname: "mssql_db",
    instance_name: "MSSQLSERVER",
    port: "1433",
    pool: Ecto.Adapters.SQL.Sandbox,
    ownership_pool: DBConnection.Poolboy,
    pool_size: 10
else
  config :ship_replication, ShipReplication.Repo,
    adapter: MssqlEcto,
    database: "ship_replication_test",
    username: "sa",
    password: "reallyStrongPwd123",
    hostname: host,
    instance_name: "MSSQLSERVER",
    port: "1433",
    pool: Ecto.Adapters.SQL.Sandbox,
    ownership_pool: DBConnection.Poolboy
end