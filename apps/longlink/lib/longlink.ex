defmodule Longlink do
  @repo Longlink.Repo
  alias Longlink.Link

  def create_redirection(%{"original" => original}) do
    short = "unimplemented!"

    %Link{}
    |> Link.changeset(%{short: short, original: original})
    |> @repo.insert()
  end

  def create(original) do
    # insert first, to avoid data race
    # in case many requests rush in simultaneously
    with {:ok, link} <- create_redirection(%{"original" => original}) do
      link
      |> Ecto.Changeset.change(short: link.id |> Base62.encode())
      |> @repo.update()
    end
  end

  def get_original_link(%{short: short} = attr) do
    @repo.get_by(Link, attr)
  end

  def list_links() do
    @repo.all(Link)
  end
end
