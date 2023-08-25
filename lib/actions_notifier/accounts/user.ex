defmodule ActionsNotifier.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :github_token, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:github_token])
    |> validate_required([:github_token])
  end
end
