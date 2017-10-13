defmodule Telix.CDP.Connection do
  import Telix.Api

  def health_summary(client) do
    payload = %{
      "1" => %{
        "command" => "cdp.connection.health.summary"
      }
    }

    do_post payload, client
  end
end
