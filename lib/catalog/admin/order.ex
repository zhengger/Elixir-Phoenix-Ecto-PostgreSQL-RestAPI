defmodule Catalog.Admin.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :name, :string
    field :address, :string
    field :role, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:name, :email, :role, :address])
    |> validate_required([:name, :email, :role, :address])
    |> unique_constraint(:email)
  end
end
