defmodule TiendaWeb.ProductoHTML do
  use TiendaWeb, :html

 embed_templates "producto_html/*"


  @doc """
  Renders a producto form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def producto_form(assigns)
end
