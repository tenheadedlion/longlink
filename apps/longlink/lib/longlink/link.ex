defmodule Longlink.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field(:short, :string)
    field(:original, :string)
    timestamps()
  end

  def changeset(link, params \\ %{}) do
    link
    |> cast(params, [:short, :original])
    |> validate_change(:original, &validate_url/2)
  end

  def validate_url(:original, url) do
    case EctoFields.URL.cast(url) do
      :error -> [content: "invalid url, expect a valid fully qualified url"]
      _ -> []
    end
  end
end
