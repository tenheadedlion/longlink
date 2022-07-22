defmodule LonglinkWeb.PageController do
  use LonglinkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    id |> IO.inspect()

    with link when not is_nil(link) <- Longlink.get_original_link(%{short: id}) do
      render(conn, "show.html", link: link)
    end
  end
end
