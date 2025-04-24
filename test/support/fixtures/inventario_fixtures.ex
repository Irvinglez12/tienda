defmodule Tienda.InventarioFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tienda.Inventario` context.
  """

  @doc """
  Generate a producto.
  """
  def producto_fixture(attrs \\ %{}) do
    {:ok, producto} =
      attrs
      |> Enum.into(%{
        clave: 42,
        descripcion: "some descripcion",
        precio: 120.5,
        tipo: 42
      })
      |> Tienda.Inventario.create_producto()

    producto
  end
end
