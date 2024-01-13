defmodule TestDoubleStrategies do
  @moduledoc """
  Invoke a function on a service without knowing which implementation is used.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EnvSpecificServices.hello()
      :world

  """
  def hello_with_genservers(name) do
    TestDoubleStrategies.MessagePassingService.hello(name)
  end

  def hello_with_dynamic_module_resolution(name) do
    TestDoubleStrategies.AppConfigService.hello(name)
  end

  def hello_with_static_module_resolution(name) do
    TestDoubleStrategies.StaticConfigService.hello(name)
  end
end
