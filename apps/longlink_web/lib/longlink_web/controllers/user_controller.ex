defmodule LonglinkWeb.UserController do
  use LonglinkWeb, :controller

  def show(conn, %{"id" => id}) do
    user = Longlink.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    user = Longlink.new_user()
    render(conn, "new.html", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Longlink.insert_user(user_params) do
      {:ok, user} -> redirect(conn, to: Routes.user_path(conn, :show, user))
      {:error, user} -> render(conn, "new.html", user: user)
    end
  end
end
