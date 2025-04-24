defmodule Tienda.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TiendaWeb.Telemetry,
      Tienda.Repo,
      {DNSCluster, query: Application.get_env(:tienda, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Tienda.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Tienda.Finch},
      # Start a worker by calling: Tienda.Worker.start_link(arg)
      # {Tienda.Worker, arg},
      # Start to serve requests, typically the last entry
      TiendaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tienda.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TiendaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
