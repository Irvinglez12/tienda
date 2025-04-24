defmodule TiendaWeb.ProductoControllerTest do
  use TiendaWeb.ConnCase

  import Tienda.InventarioFixtures

  @create_attrs %{clave: 42, descripcion: "some descripcion", precio: 120.5, tipo: 42}
  @update_attrs %{clave: 43, descripcion: "some updated descripcion", precio: 456.7, tipo: 43}
  @invalid_attrs %{clave: nil, descripcion: nil, precio: nil, tipo: nil}

  describe "index" do
    test "lists all productos", %{conn: conn} do
      conn = get(conn, ~p"/productos")
      assert html_response(conn, 200) =~ "Listing Productos"
    end
  end

  describe "new producto" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/productos/new")
      assert html_response(conn, 200) =~ "New Producto"
    end
  end

  describe "create producto" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/productos", producto: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/productos/#{id}"

      conn = get(conn, ~p"/productos/#{id}")
      assert html_response(conn, 200) =~ "Producto #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/productos", producto: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Producto"
    end
  end

  describe "edit producto" do
    setup [:create_producto]

    test "renders form for editing chosen producto", %{conn: conn, producto: producto} do
      conn = get(conn, ~p"/productos/#{producto}/edit")
      assert html_response(conn, 200) =~ "Edit Producto"
    end
  end

  describe "update producto" do
    setup [:create_producto]

    test "redirects when data is valid", %{conn: conn, producto: producto} do
      conn = put(conn, ~p"/productos/#{producto}", producto: @update_attrs)
      assert redirected_to(conn) == ~p"/productos/#{producto}"

      conn = get(conn, ~p"/productos/#{producto}")
      assert html_response(conn, 200) =~ "some updated descripcion"
    end

    test "renders errors when data is invalid", %{conn: conn, producto: producto} do
      conn = put(conn, ~p"/productos/#{producto}", producto: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Producto"
    end
  end

  describe "delete producto" do
    setup [:create_producto]

    test "deletes chosen producto", %{conn: conn, producto: producto} do
      conn = delete(conn, ~p"/productos/#{producto}")
      assert redirected_to(conn) == ~p"/productos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/productos/#{producto}")
      end
    end
  end

  defp create_producto(_) do
    producto = producto_fixture()
    %{producto: producto}
  end
end
