defmodule LonglinkWeb.Authenticator do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    user =
      conn
      |> get_session(:user_id)
      |> case do
        nil -> nil
        id -> Longlink.get_user(id)
      end

    assign(conn, :current_user, user)
  end
end
