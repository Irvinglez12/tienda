defmodule Tienda.InventarioTest do
  use Tienda.DataCase

  alias Tienda.Inventario

  describe "productos" do
    alias Tienda.Inventario.Producto

    import Tienda.InventarioFixtures

    @invalid_attrs %{clave: nil, descripcion: nil, precio: nil, tipo: nil}

    test "list_productos/0 returns all productos" do
      producto = producto_fixture()
      assert Inventario.list_productos() == [producto]
    end

    test "get_producto!/1 returns the producto with given id" do
      producto = producto_fixture()
      assert Inventario.get_producto!(producto.id) == producto
    end

    test "create_producto/1 with valid data creates a producto" do
      valid_attrs = %{clave: 42, descripcion: "some descripcion", precio: 120.5, tipo: 42}

      assert {:ok, %Producto{} = producto} = Inventario.create_producto(valid_attrs)
      assert producto.clave == 42
      assert producto.descripcion == "some descripcion"
      assert producto.precio == 120.5
      assert producto.tipo == 42
    end

    test "create_producto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventario.create_producto(@invalid_attrs)
    end

    test "update_producto/2 with valid data updates the producto" do
      producto = producto_fixture()
      update_attrs = %{clave: 43, descripcion: "some updated descripcion", precio: 456.7, tipo: 43}

      assert {:ok, %Producto{} = producto} = Inventario.update_producto(producto, update_attrs)
      assert producto.clave == 43
      assert producto.descripcion == "some updated descripcion"
      assert producto.precio == 456.7
      assert producto.tipo == 43
    end

    test "update_producto/2 with invalid data returns error changeset" do
      producto = producto_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventario.update_producto(producto, @invalid_attrs)
      assert producto == Inventario.get_producto!(producto.id)
    end

    test "delete_producto/1 deletes the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{}} = Inventario.delete_producto(producto)
      assert_raise Ecto.NoResultsError, fn -> Inventario.get_producto!(producto.id) end
    end

    test "change_producto/1 returns a producto changeset" do
      producto = producto_fixture()
      assert %Ecto.Changeset{} = Inventario.change_producto(producto)
    end
  end
end
