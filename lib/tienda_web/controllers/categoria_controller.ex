defmodule TiendaWeb.CategoriaController do
  use TiendaWeb, :controller

  alias Tienda.Catalogo
  alias Tienda.Catalogo.Categoria

  def index(conn, _params) do
    categorias = Catalogo.list_categorias()
    render(conn, :index, categorias: categorias)
  end

  def new(conn, _params) do
    changeset = Catalogo.change_categoria(%Categoria{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"categoria" => categoria_params}) do
    case Catalogo.create_categoria(categoria_params) do
      {:ok, categoria} ->
        conn
        |> put_flash(:info, "Categoria created successfully.")
        |> redirect(to: ~p"/categorias/#{categoria.id_categoria}") # Cambié a `categoria.id_categoria`

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    categoria = Catalogo.get_categoria!(id)
    render(conn, :show, categoria: categoria)
  end

  def edit(conn, %{"id" => id}) do
    categoria = Catalogo.get_categoria!(id)
    changeset = Catalogo.change_categoria(categoria)
    render(conn, :edit, categoria: categoria, changeset: changeset)
  end

  def update(conn, %{"id" => id, "categoria" => categoria_params}) do
    categoria = Catalogo.get_categoria!(id)

    case Catalogo.update_categoria(categoria, categoria_params) do
      {:ok, categoria} ->
        conn
        |> put_flash(:info, "Categoria updated successfully.")
        |> redirect(to: ~p"/categorias/#{categoria.id_categoria}") # Cambié a `categoria.id_categoria`

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, categoria: categoria, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
  categoria = Catalogo.get_categoria!(id)

  try do
    {:ok, _categoria} = Catalogo.delete_categoria(categoria)
    conn
    |> put_flash(:info, "Categoría eliminada correctamente.")
    |> redirect(to: ~p"/categorias")
  rescue
    Ecto.ConstraintError ->
      conn
      |> put_flash(:error, "No se puede eliminar la categoría porque tiene productos asociados.")
      |> redirect(to: ~p"/categorias")
  end
end

end
