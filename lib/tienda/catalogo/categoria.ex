defmodule Tienda.Catalogo.Categoria do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id_categoria, :id, autogenerate: true} # Mantén id_categoria como la clave primaria

  schema "categorias" do
    field :descripcion, :string

    timestamps()
  end

  @doc """
  Crea un changeset para la categoría.
  """
  def changeset(categoria, attrs) do
    categoria
    |> cast(attrs, [:descripcion])    # Define los campos que se pueden modificar
    |> validate_required([:descripcion])  # Valida que el campo descripcion no sea nulo
  end
end
