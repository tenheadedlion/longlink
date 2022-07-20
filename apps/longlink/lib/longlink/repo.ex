defmodule Longlink.Repo do
  use Ecto.Repo,
    otp_app: :longlink,
    adapter: Ecto.Adapters.SQLite3
end
