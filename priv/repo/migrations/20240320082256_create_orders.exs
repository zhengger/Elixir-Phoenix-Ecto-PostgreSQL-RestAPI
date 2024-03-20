defmodule Catalog.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :name, :string
      add :email, :string
      add :role, :string
      add :address, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:orders, [:email])
  end
end
