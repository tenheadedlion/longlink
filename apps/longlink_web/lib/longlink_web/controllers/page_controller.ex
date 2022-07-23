defmodule LonglinkWeb.PageController do
  use LonglinkWeb, :controller

  def show(conn, %{"id" => id}) do
    conn = assign(conn, :is_public, true)

    with link when not is_nil(link) <- Longlink.get_link(%{short: id}) do
      render(conn, "show.html", link: link)
    end
  end
end
