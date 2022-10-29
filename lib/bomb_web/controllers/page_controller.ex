defmodule BombWeb.PageController do
  use BombWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
