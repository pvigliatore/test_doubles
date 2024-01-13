defmodule TestDoubleStrategies.StaticConfigService do
  def hello(name) do
    impl().hello(name)
  end

  defp impl() do
    Application.fetch_env!(:test_double_strategies, :static_config_service) |> IO.inspect()
  end
end
