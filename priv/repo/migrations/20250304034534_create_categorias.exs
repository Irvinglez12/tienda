defmodule Tienda.Repo.Migrations.CreateCategorias do
  use Ecto.Migration

  def change do
    create table(:categorias, primary_key: false) do
      add :id_categoria, :serial, primary_key: true
      add :descripcion, :string, null: false
      timestamps()
    end
  end
end