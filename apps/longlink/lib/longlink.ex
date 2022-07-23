defmodule Longlink do
  @repo Longlink.Repo
  alias Longlink.{Link, User, Password}

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

  def get_link(attr) do
    attr |> IO.inspect()
    @repo.get_by(Link, attr)
  end

  def get_user(id) do
    @repo.get!(User, id)
  end

  def new_user() do
    User.changeset_with_password_and_invite_code(%User{})
  end

  def insert_user(params) do
    %User{}
    |> User.changeset_with_password_and_invite_code(params)
    |> @repo.insert()
  end

  def get_user_by_username_and_password(username, password) do
    with user when not is_nil(user) <- @repo.get_by(User, %{username: username}),
         true <-
           Password.verify_with_hash(password, user.hashed_password) do
      user
    else
      _ -> Password.dummy_verify()
    end
  end
end
