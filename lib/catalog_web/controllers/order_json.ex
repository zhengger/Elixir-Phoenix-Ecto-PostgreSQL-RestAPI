defmodule CatalogWeb.OrderJSON do
  alias Catalog.Admin.Order

  @doc """
  Renders a list of orders.
  """
  def index(%{orders: orders}) do
    %{data: for(order <- orders, do: data(order))}
  end

  @doc """
  Renders a single order.
  """
  def show(%{order: order}) do
    %{data: data(order)}
  end

  defp data(%Order{} = order) do
    %{
      id: order.id,
      name: order.name,
      email: order.email,
      role: order.role,
      address: order.address
    }
  end
end
