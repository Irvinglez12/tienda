defmodule TiendaWeb.CategoriaControllerTest do
  use TiendaWeb.ConnCase

  import Tienda.CatalogoFixtures

  @create_attrs %{clave_tipo: "some clave_tipo", descripcion: "some descripcion"}
  @update_attrs %{clave_tipo: "some updated clave_tipo", descripcion: "some updated descripcion"}
  @invalid_attrs %{clave_tipo: nil, descripcion: nil}

  describe "index" do
    test "lists all categorias", %{conn: conn} do
      conn = get(conn, ~p"/categorias")
      assert html_response(conn, 200) =~ "Listing Categorias"
    end
  end

  describe "new categoria" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/categorias/new")
      assert html_response(conn, 200) =~ "New Categoria"
    end
  end

  describe "create categoria" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/categorias", categoria: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/categorias/#{id}"

      conn = get(conn, ~p"/categorias/#{id}")
      assert html_response(conn, 200) =~ "Categoria #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/categorias", categoria: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Categoria"
    end
  end

  describe "edit categoria" do
    setup [:create_categoria]

    test "renders form for editing chosen categoria", %{conn: conn, categoria: categoria} do
      conn = get(conn, ~p"/categorias/#{categoria}/edit")
      assert html_response(conn, 200) =~ "Edit Categoria"
    end
  end

  describe "update categoria" do
    setup [:create_categoria]

    test "redirects when data is valid", %{conn: conn, categoria: categoria} do
      conn = put(conn, ~p"/categorias/#{categoria}", categoria: @update_attrs)
      assert redirected_to(conn) == ~p"/categorias/#{categoria}"

      conn = get(conn, ~p"/categorias/#{categoria}")
      assert html_response(conn, 200) =~ "some updated clave_tipo"
    end

    test "renders errors when data is invalid", %{conn: conn, categoria: categoria} do
      conn = put(conn, ~p"/categorias/#{categoria}", categoria: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Categoria"
    end
  end

  describe "delete categoria" do
    setup [:create_categoria]

    test "deletes chosen categoria", %{conn: conn, categoria: categoria} do
      conn = delete(conn, ~p"/categorias/#{categoria}")
      assert redirected_to(conn) == ~p"/categorias"

      assert_error_sent 404, fn ->
        get(conn, ~p"/categorias/#{categoria}")
      end
    end
  end

  defp create_categoria(_) do
    categoria = categoria_fixture()
    %{categoria: categoria}
  end
end
