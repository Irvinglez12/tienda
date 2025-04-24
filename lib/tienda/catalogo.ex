defmodule Tienda.Catalogo do
  @moduledoc """
  The Catalogo context.
  """

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.Catalogo.Categoria

  @doc """
  Returns the list of categorias.

  ## Examples

      iex> list_categorias()
      [%Categoria{}, ...]

  """
  def list_categorias do
    Repo.all(Categoria)
  end

  @doc """
  Gets a single categoria.

  Raises `Ecto.NoResultsError` if the Categoria does not exist.

  ## Examples

      iex> get_categoria!(123)
      %Categoria{}

      iex> get_categoria!(456)
      ** (Ecto.NoResultsError)

  """
  def get_categoria!(id), do: Repo.get!(Categoria, id)

  @doc """
  Creates a categoria.

  ## Examples

      iex> create_categoria(%{field: value})
      {:ok, %Categoria{}}

      iex> create_categoria(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_categoria(attrs \\ %{}) do
    %Categoria{}
    |> Categoria.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a categoria.

  ## Examples

      iex> update_categoria(categoria, %{field: new_value})
      {:ok, %Categoria{}}

      iex> update_categoria(categoria, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_categoria(%Categoria{} = categoria, attrs) do
    categoria
    |> Categoria.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a categoria.

  ## Examples

      iex> delete_categoria(categoria)
      {:ok, %Categoria{}}

      iex> delete_categoria(categoria)
      {:error, %Ecto.Changeset{}}

  """
  def delete_categoria(%Categoria{} = categoria) do
    Repo.delete(categoria)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking categoria changes.

  ## Examples

      iex> change_categoria(categoria)
      %Ecto.Changeset{data: %Categoria{}}

  """
  def change_categoria(%Categoria{} = categoria, attrs \\ %{}) do
    Categoria.changeset(categoria, attrs)
  end
end
