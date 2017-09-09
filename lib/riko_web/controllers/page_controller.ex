defmodule RikoWeb.PageController do
  use RikoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
