defmodule Catalog.Repo.Migrations.CreateStore do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string
      timestamps()
    end
  end
end
