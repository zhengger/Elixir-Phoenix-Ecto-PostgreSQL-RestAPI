defmodule Catalog.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Catalog.Admin` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{

      })
      |> Catalog.Admin.create_order()

    order
  end

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: unique_user_email(),
        name: "some name",
        role: "some role"
      })
      |> Catalog.Admin.create_user()

    user
  end

  @doc """
  Generate a unique order email.
  """
  def unique_order_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: unique_order_email(),
        name: "some name",
        role: "some role"
      })
      |> Catalog.Admin.create_order()

    order
  end
end
