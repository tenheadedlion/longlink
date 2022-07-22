defmodule Longlink do
  @repo Longlink.Repo
  alias Longlink.Link

  def new_link() do
    Longlink.Link.changeset(%Longlink.Link{}) |> IO.inspect()
  end

  def insert_link(attrs) do
    with {:ok, link} <-
           %Link{}
           |> Link.changeset(Map.put(attrs, "short", "umimplemented!"))
           |> @repo.insert() do
      link
      |> Ecto.Changeset.change(short: link.id |> Base62.encode())
      |> IO.inspect()
      |> @repo.update()
    end
  end

  # def create_redirection(%{"original" => original}) do
  #  short = "unimplemented!"
  #
  #  %Link{}
  #  |> Link.changeset(%{short: short, original: original})
  #  |> @repo.insert()
  # end
  #
  # def create(original) do
  #  # insert first, to avoid data race
  #  # in case many requests rush in simultaneously
  #  with {:ok, link} <- create_redirection(%{"original" => original}) do
  #    link
  #    |> Ecto.Changeset.change(short: link.id |> Base62.encode())
  #    |> @repo.update()
  #  end
  # end

  def get_original_link(attr) do
    attr |> IO.inspect()
    @repo.get_by(Link, attr)
  end

  def list_links() do
    @repo.all(Link)
  end
end
