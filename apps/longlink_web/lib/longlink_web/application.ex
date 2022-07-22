defmodule LonglinkWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LonglinkWeb.Telemetry,
      # Start the Endpoint (http/https)
      LonglinkWeb.Endpoint,
      # Start a worker by calling: LonglinkWeb.Worker.start_link(arg)
      # {LonglinkWeb.Worker, arg}
       {Phoenix.PubSub, name: LonglinkWeb.PubSub}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LonglinkWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LonglinkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
