defmodule TiendaWeb.CategoriaHTML do
  use TiendaWeb, :html

  embed_templates "categoria_html/*"

  @doc """
  Renders a categoria form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def categoria_form(assigns)
end
