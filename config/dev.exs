use Mix.Config

config :telix,
  auth: %{
    thingKey: "358239051214957",
    appId: "casaiq",
    appToken: System.get_env("TELIT_TOKEN")
  }
