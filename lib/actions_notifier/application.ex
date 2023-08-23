defmodule ActionsNotifier.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Desktop.identify_default_locale(ActionsNotifierWeb.Gettext)

    children = [
      # Start the Telemetry supervisor
      ActionsNotifierWeb.Telemetry,
      # Start the Ecto repository
      ActionsNotifier.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ActionsNotifier.PubSub},
      # Start Finch
      {Finch, name: ActionsNotifier.Finch},
      # Start the Endpoint (http/https)
      ActionsNotifierWeb.Endpoint,
      {Desktop.Window,
        app: :actions_notifier,
        id: ActionsNotifierWindow,
        url: &ActionsNotifierWeb.Endpoint.url/0
      }
      # Start a worker by calling: ActionsNotifier.Worker.start_link(arg)
      # {ActionsNotifier.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ActionsNotifier.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ActionsNotifierWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
