defmodule Longlink do
  @repo Longlink.Repo
  alias Longlink.Link

  def create_redirection(%{"original" => original}) do
    short = "1"
    %Link{}
    |> Link.changeset(%{short: short, original: original})
    |> @repo.insert()
  end

  def list_links() do
    @repo.all(Link)
  end
end
