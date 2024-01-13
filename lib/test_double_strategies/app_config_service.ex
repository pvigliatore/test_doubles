defmodule TestDoubleStrategies.AppConfigService do
  def hello(name), do: impl().hello(name)

  defp impl() do
    case Application.get_env(:test_double_strategies, :env) do
      :test -> TestDoubleStrategies.AppConfigServiceTestDouble
       :dev -> TestDoubleStrategies.AppConfigServiceImpl
    end
  end
end
