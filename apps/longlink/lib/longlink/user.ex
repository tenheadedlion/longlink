defmodule Longlink.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:username, :string)
    # `virtual: true` means that this field won't be persisted in the database
    field(:password, :string, virtual: true)
    field(:invite_code, :string, virtual: true)
    field(:hashed_password, :string)
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:username])
    |> validate_required([:username, :hashed_password])
    |> validate_length(:username, min: 3)
    |> unique_constraint(:username)
  end

  def changeset_with_password_and_invite_code(user, params \\ %{}) do
    user
    |> cast(params, [:password, :invite_code])
    |> validate_required([:password, :invite_code])
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, require: true)
    |> validate_change(:invite_code, &validate_invite_code/2)
    |> hash_password()
    |> changeset(params)
  end

  def validate_invite_code(:invite_code, code) do
    case Longlink.InviteCode.validate(code) do
      true -> []
      false -> [invite_code: "Invalid invite code"]
    end
  end

  def hash_password(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:hashed_password, Longlink.Password.hash(password))
  end

  def hash_password(changeset), do: changeset
end
