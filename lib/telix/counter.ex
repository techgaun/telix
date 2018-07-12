defmodule Telix.Counter do
  @moduledoc """
  This module provides a quick interface to get the information
  on the [Counter service][m2m-counter-svc] from Telit M2M interface.

  [m2m-counter-svc]: http://help.devicewise.com/display/ARG/Counter+service
  """
  use Telix.Endpoint

  def count(client, params) do
    do_post(build_payload("counter.count", params), client)
  end

  def fields(client, type) when is_binary(type) do
    fields(client, %{"type" => type})
  end

  def fields(client, params) when is_map(params) do
    do_post(build_payload("counter.fields", params), client)
  end

  def types(client) do
    do_post(build_payload("counter.types"), client)
  end
end
