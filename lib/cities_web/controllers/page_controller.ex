defmodule CitiesWeb.PageController do
  use CitiesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
