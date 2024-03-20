defmodule Catalog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CatalogWeb.Telemetry,
      Catalog.Repo,
      {DNSCluster, query: Application.get_env(:catalog, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Catalog.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Catalog.Finch},
      # Start a worker by calling: Catalog.Worker.start_link(arg)
      # {Catalog.Worker, arg},
      # Start to serve requests, typically the last entry
      CatalogWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Catalog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CatalogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
