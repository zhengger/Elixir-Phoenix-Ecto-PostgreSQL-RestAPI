defmodule Catalog.AdminTest do
  use Catalog.DataCase

  alias Catalog.Admin

  describe "orders" do
    alias Catalog.Admin.Order

    import Catalog.AdminFixtures

    @invalid_attrs %{}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Admin.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Admin.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{}

      assert {:ok, %Order{} = order} = Admin.create_order(valid_attrs)
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{}

      assert {:ok, %Order{} = order} = Admin.update_order(order, update_attrs)
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_order(order, @invalid_attrs)
      assert order == Admin.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Admin.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Admin.change_order(order)
    end
  end

  describe "users" do
    alias Catalog.Admin.User

    import Catalog.AdminFixtures

    @invalid_attrs %{name: nil, address: nil, role: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", address: "some address", role: "some role", email: "some email"}

      assert {:ok, %User{} = user} = Admin.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.address == "some address"
      assert user.role == "some role"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", role: "some updated role", email: "some updated email"}

      assert {:ok, %User{} = user} = Admin.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.address == "some updated address"
      assert user.role == "some updated role"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end

  describe "orders" do
    alias Catalog.Admin.Order

    import Catalog.AdminFixtures

    @invalid_attrs %{name: nil, address: nil, role: nil, email: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Admin.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Admin.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{name: "some name", address: "some address", role: "some role", email: "some email"}

      assert {:ok, %Order{} = order} = Admin.create_order(valid_attrs)
      assert order.name == "some name"
      assert order.address == "some address"
      assert order.role == "some role"
      assert order.email == "some email"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", role: "some updated role", email: "some updated email"}

      assert {:ok, %Order{} = order} = Admin.update_order(order, update_attrs)
      assert order.name == "some updated name"
      assert order.address == "some updated address"
      assert order.role == "some updated role"
      assert order.email == "some updated email"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_order(order, @invalid_attrs)
      assert order == Admin.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Admin.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Admin.change_order(order)
    end
  end
end
