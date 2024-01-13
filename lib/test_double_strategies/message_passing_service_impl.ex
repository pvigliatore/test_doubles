defmodule TestDoubleStrategies.MessagePassingServiceImpl do
  use GenServer

  @service TestDoubleStrategies.MessagePassingService.service_name()

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: @service)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:hello, name}, _from, state) do
    {:reply, "Hello #{name} from my Prod implementation", state}
  end
end
