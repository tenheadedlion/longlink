defmodule LonglinkWeb.PageController do
  use LonglinkWeb, :controller

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
