defmodule TestDoubleStrategies.MessagePassingService do

  # Public API
  def hello(name) do
    GenServer.call(service_name(), {:hello, name})
  end

  def service_name, do: :message_passing_service
end
