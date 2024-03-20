defmodule CatalogWeb.OrderController do
  use CatalogWeb, :controller

  alias Catalog.Admin
  alias Catalog.Admin.Order

  action_fallback CatalogWeb.FallbackController

  def index(conn, _params) do
    orders = Admin.list_orders()
    render(conn, :index, orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Admin.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/orders/#{order}")
      |> render(:show, order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Admin.get_order!(id)
    render(conn, :show, order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Admin.get_order!(id)

    with {:ok, %Order{} = order} <- Admin.update_order(order, order_params) do
      render(conn, :show, order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Admin.get_order!(id)

    with {:ok, %Order{}} <- Admin.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
