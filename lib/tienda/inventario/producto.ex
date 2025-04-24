defmodule Tienda.Inventario.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}

  schema "productos" do
    field :descripcion, :string
    field :precio, :decimal

    # ✅ Corrección en la relación
    belongs_to :categoria, Tienda.Catalogo.Categoria, foreign_key: :id_categoria, references: :id_categoria

    timestamps()
  end

  @doc """
  Crea un changeset para el producto.
  """
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:descripcion, :precio, :id_categoria])
    |> validate_required([:descripcion, :precio, :id_categoria])
    |> foreign_key_constraint(:id_categoria)
  end
end
