defmodule TiendaWeb.ProductoController do
  use TiendaWeb, :controller

  alias Tienda.Inventario
  alias Tienda.Inventario.Producto
  alias Tienda.Repo

  def index(conn, _params) do
    productos = Inventario.list_productos() |> Repo.preload(:categoria)
    render(conn, :index, productos: productos)
  end

  def new(conn, _params) do
  categorias = Repo.all(Tienda.Catalogo.Categoria)
|> Enum.map(&{to_string(&1.descripcion), "#{&1.id_categoria}"})  # Garantiza que el ID sea string


  IO.inspect(categorias, label: "Categorías cargadas en new")

  changeset = Producto.changeset(%Producto{}, %{})
  render(conn, :new, changeset: changeset, categorias: categorias, action: ~p"/productos")
end

  def create(conn, %{"producto" => producto_params}) do
    case Inventario.create_producto(producto_params) do
      {:ok, producto} ->
        conn
        |> put_flash(:info, "Producto creado exitosamente.")
        |> redirect(to: ~p"/productos/#{producto.id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        categorias = Inventario.listar_categorias() |> Enum.map(&{&1.descripcion, &1.id_categoria})
        render(conn, :new, changeset: changeset, categorias: categorias)
    end
  end

  def show(conn, %{"id" => id}) do
    producto = Inventario.get_producto!(id) |> Repo.preload(:categoria)
    render(conn, :show, producto: producto)
  end

  def edit(conn, %{"id" => id}) do
  producto = Inventario.get_producto!(id) |> Repo.preload(:categoria)
  changeset = Inventario.change_producto(producto)

  categorias = Repo.all(Tienda.Catalogo.Categoria)
|> Enum.map(&{to_string(&1.descripcion), "#{&1.id_categoria}"})  # Garantiza que el ID sea string

  render(conn, :edit, producto: producto, changeset: changeset, categorias: categorias)
end

  def update(conn, %{"id" => id, "producto" => producto_params}) do
    producto = Inventario.get_producto!(id) |> Repo.preload(:categoria)

    case Inventario.update_producto(producto, producto_params) do
      {:ok, producto} ->
        conn
        |> put_flash(:info, "Producto actualizado correctamente.")
        |> redirect(to: ~p"/productos/#{producto.id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        categorias = Inventario.listar_categorias() |> Enum.map(&{to_string(&1.descripcion), "#{&1.id_categoria}"})

        render(conn, :edit, producto: producto, changeset: changeset, categorias: categorias)
    end
  end

  def delete(conn, %{"id" => id}) do
    producto = Inventario.get_producto!(id)
    {:ok, _producto} = Inventario.delete_producto(producto)

    conn
    |> put_flash(:info, "Producto eliminado correctamente.")
    |> redirect(to: ~p"/productos")
  end
end
