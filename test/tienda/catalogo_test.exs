defmodule Tienda.CatalogoTest do
  use Tienda.DataCase

  alias Tienda.Catalogo

  describe "categorias" do
    alias Tienda.Catalogo.Categoria

    import Tienda.CatalogoFixtures

    @invalid_attrs %{clave_tipo: nil, descripcion: nil}

    test "list_categorias/0 returns all categorias" do
      categoria = categoria_fixture()
      assert Catalogo.list_categorias() == [categoria]
    end

    test "get_categoria!/1 returns the categoria with given id" do
      categoria = categoria_fixture()
      assert Catalogo.get_categoria!(categoria.id) == categoria
    end

    test "create_categoria/1 with valid data creates a categoria" do
      valid_attrs = %{clave_tipo: "some clave_tipo", descripcion: "some descripcion"}

      assert {:ok, %Categoria{} = categoria} = Catalogo.create_categoria(valid_attrs)
      assert categoria.clave_tipo == "some clave_tipo"
      assert categoria.descripcion == "some descripcion"
    end

    test "create_categoria/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogo.create_categoria(@invalid_attrs)
    end

    test "update_categoria/2 with valid data updates the categoria" do
      categoria = categoria_fixture()
      update_attrs = %{clave_tipo: "some updated clave_tipo", descripcion: "some updated descripcion"}

      assert {:ok, %Categoria{} = categoria} = Catalogo.update_categoria(categoria, update_attrs)
      assert categoria.clave_tipo == "some updated clave_tipo"
      assert categoria.descripcion == "some updated descripcion"
    end

    test "update_categoria/2 with invalid data returns error changeset" do
      categoria = categoria_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogo.update_categoria(categoria, @invalid_attrs)
      assert categoria == Catalogo.get_categoria!(categoria.id)
    end

    test "delete_categoria/1 deletes the categoria" do
      categoria = categoria_fixture()
      assert {:ok, %Categoria{}} = Catalogo.delete_categoria(categoria)
      assert_raise Ecto.NoResultsError, fn -> Catalogo.get_categoria!(categoria.id) end
    end

    test "change_categoria/1 returns a categoria changeset" do
      categoria = categoria_fixture()
      assert %Ecto.Changeset{} = Catalogo.change_categoria(categoria)
    end
  end
end
