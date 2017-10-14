defmodule Telix.CDP.Connection do
  use Telix.Endpoint

  def find(client, params) do
    do_post build_payload("cdp.connection.find", params), client
  end

  def health_summary(client) do
    do_post build_payload("cdp.connection.health.summary"), client
  end
end
