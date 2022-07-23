defmodule LonglinkWeb.LonglinkController do
  use LonglinkWeb, :controller

  def new(conn, _params) do
    link = Longlink.new_link()
    render(conn, "new.html", link: link, action: Routes.longlink_path(conn, :create))
  end

  def create(conn, %{"link" => link}) do
    link |> IO.inspect()

    case Longlink.insert_link(link) do
      {:ok, link} ->
        redirect(conn, to: Routes.longlink_path(conn, :show, %{link | id: link.short}))

      {:error, link} ->
        render(conn, "new.html", link: link)
    end
  end

  def show(conn, %{"id" => short}) do
    short |> IO.inspect()

    with link when not is_nil(link) <- Longlink.get_link(%{short: short}) do
      render(conn, "show.html", %{
        link: link,
        short_url:
          Path.join([to_string(conn.scheme) <> "://", conn.host <> ":#{conn.port}", link.short])
      })
    end
  end
end
