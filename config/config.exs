import Config

config :test_double_strategies, env: Config.config_env()

# Define implementations of services here
config :test_double_strategies,
  static_config_service: TestDoubleStrategies.StaticConfigServiceImpl

import_config("#{config_env()}.exs")
