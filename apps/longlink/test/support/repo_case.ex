defmodule Longlink.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Longlink.Repo

      import Ecto
      import Ecto.Query
      import Longlink.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Longlink.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Longlink.Repo, {:shared, self()})
    end

    :ok
  end
end
