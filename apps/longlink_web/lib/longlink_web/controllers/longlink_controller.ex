defmodule LonglinkWeb.LonglinkController do
  use LonglinkWeb, :controller

  def show(conn, %{"id" => short_url}) do
    short_url |> IO.inspect()
    with link when not is_nil(link) <- Longlink.get_original_link(%{short: short_url}) do
      render(conn, "show.html", link: link)
    end
  end
end
