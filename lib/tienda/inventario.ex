defmodule Tienda.Inventario do
  import Ecto.Query, warn: false
  alias Tienda.Repo
  alias Tienda.Inventario.Producto
alias Tienda.Catalogo.Categoria  # ✅ Importación correcta

  def list_productos do
    Repo.all(Producto)
  end

  def get_producto!(id), do: Repo.get!(Producto, id)

  def create_producto(attrs \\ %{}) do
    %Producto{}
    |> Producto.changeset(attrs)
    |> Repo.insert()
  end

  def update_producto(%Producto{} = producto, attrs) do
    producto
    |> Producto.changeset(attrs)
    |> Repo.update()
  end

  def delete_producto(%Producto{} = producto) do
    Repo.delete(producto)
  end

  def change_producto(%Producto{} = producto, attrs \\ %{}) do
    Producto.changeset(producto, attrs)
  end

  # ✅ Nueva función para listar categorías
  def listar_categorias do
  Repo.all(Categoria)
end



end
