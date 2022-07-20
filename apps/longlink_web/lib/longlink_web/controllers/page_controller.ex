defmodule LonglinkWeb.PageController do
  use LonglinkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
