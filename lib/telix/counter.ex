defmodule Telix.Counter do
  @moduledoc """
  This module provides a quick interface to get the information
  on the [Counter service][m2m-counter-svc] from Telit M2M interface.

  [m2m-counter-svc]: http://help.devicewise.com/display/ARG/Counter+service
  """
  import Telix.Api

  def count(client, params) do
    payload = %{
      "1" => %{
        "command" => "counter.count",
        "params" => params
      }
    }

    do_post payload, client
  end

  def fields(client, type) when is_binary(type) do
    fields(client, %{"type" => type})
  end
  def fields(client, params) when is_map(params) do
    payload = %{
      "1" => %{
        "command" => "counter.fields",
        "params" => params
      }
    }

    do_post payload, client
  end

  def types(client) do
    payload = %{
      "1" => %{
        "command" => "counter.types"
      }
    }

    do_post payload, client
  end
end
