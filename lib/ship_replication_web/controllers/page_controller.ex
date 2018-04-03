defmodule ShipReplicationWeb.PageController do
  use ShipReplicationWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
