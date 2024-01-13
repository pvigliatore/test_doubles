defmodule TestDoubleStrategies.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Config

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: EnvSpecificServices.Worker.start_link(arg)
      expensive_service()
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestDoubleStrategies.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp expensive_service() do
    case Application.get_env(:test_double_strategies, :env) do
      :test -> TestDoubleStrategies.MessagePassingServiceTestDouble
      :dev -> TestDoubleStrategies.MessagePassingServiceImpl
    end
  end
end
