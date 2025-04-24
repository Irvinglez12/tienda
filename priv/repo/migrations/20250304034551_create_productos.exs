defmodule Tienda.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    create table(:productos) do
      add :descripcion, :string, null: false
      add :precio, :decimal, null: false
      add :id_categoria, references(:categorias, column: :id_categoria, on_delete: :restrict)  # Aquí cambiamos a :restrict
      timestamps()
    end
  end
end
