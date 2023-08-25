defmodule ActionsNotifier.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :github_token, :string

      timestamps()
    end
  end
end
