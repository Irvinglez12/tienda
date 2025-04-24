defmodule Tienda.Repo do
  use Ecto.Repo,
    otp_app: :tienda,
    adapter: Ecto.Adapters.MyXQL
end
