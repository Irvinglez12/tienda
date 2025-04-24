defmodule Tienda.CatalogoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tienda.Catalogo` context.
  """

  @doc """
  Generate a categoria.
  """
  def categoria_fixture(attrs \\ %{}) do
    {:ok, categoria} =
      attrs
      |> Enum.into(%{
        clave_tipo: "some clave_tipo",
        descripcion: "some descripcion"
      })
      |> Tienda.Catalogo.create_categoria()

    categoria
  end
end
