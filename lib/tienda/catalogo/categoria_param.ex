defmodule TiendaWeb.Param.CategoriaParam do
  defimpl Phoenix.Param, for: Tienda.Catalogo.Categoria do
    def to_param(%Tienda.Catalogo.Categoria{id_categoria: id}), do: Integer.to_string(id)
  end
end
