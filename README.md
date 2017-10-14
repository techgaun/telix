# Telix

[![Hex version](https://img.shields.io/hexpm/v/telix.svg "Hex version")](https://hex.pm/packages/telix) ![Hex downloads](https://img.shields.io/hexpm/dt/telix.svg "Hex downloads")

> Telit TR50 M2M Service Interface API Client For Elixir

## Introduction

Telix is an API client that talks with [M2M Service Interface API](http://help.devicewise.com/display/ARG/M2M+Service+Interface?src=contextnavpagetreemode)
of Telit M2M Service using [TR50 Message Format](http://help.devicewise.com/display/ARG/TR50+Message+Format?src=contextnavpagetreemode)

## Installation

Add the following line in your `mix.exs`:

```elixir
defp deps do
  [
    {:telix, "~> 0.1"}
  ]
end
```

## Configuration

Both username/password and app token based authentications are supported.
You can pass authentication related parameters while creating Telit Client.
You can also choose to create client by specifying appropriate configuration as below

With [application authentication](http://help.devicewise.com/display/ARG/HTTP+Interface#HTTPInterface-HTTPAuthentication):

```elixir
config :telix,
  auth: %{
    thingKey: "some-thing-key",
    appId: "telit-app-id",
    appToken: System.get_env("TELIT_TOKEN")
  }
```

With [user authentication](http://help.devicewise.com/display/ARG/HTTP+Interface#HTTPInterface-HTTPAuthentication)

```elixir
config :telix,
  auth: %{
    username: "some-telit-user",
    password: System.get_env("TELIT_PASSWORD")
  }
```

Currently, the user authentication does not support MFA.

## Usage

All the API calls are made by creating new [Telit Client](lib/telix/client.ex).

```elixir
:config
Telix.Client.new
|> Telix.Client.login
|> Telix.CDP.Connection.health_summary
```

```elixir
%{
  username: "some-telit-user",
  password: "some-password"
}
|> Telix.Client.new
|> Telix.Client.login
|> Telix.CDP.Connection.health_summary
```

While this library provides convenience modules to call certain commands,
you can also manually perform any sort of commands. This is esp. useful
for sending [multiple commands](http://help.devicewise.com/display/ARG/TR50+Message+Format)

```elixir
client = :config |> Telix.Client.new |> Telix.Client.login

# single command with custom params
Telix.Api.do_post build_payload("some.custom.command", %{"some" => "params"}), client

# custom command params
multi_cmd = %{
  "1" => %{
    "command" => "some.custom.command",
    "params" => %{"some" => "params"}
  },
  "2" => %{
    "command" => "another.custom.command",
    "params" => %{"some" => "params"}
  }
}
Telix.Api.do_post multi_cmd, client
```

## Author

- [techgaun](https://github.com/techgaun)
