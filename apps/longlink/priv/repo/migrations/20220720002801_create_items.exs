defmodule Longlink.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table("links") do
      add(:short, :string)
      add(:original, :string)
      timestamps()
    end
  end
end
