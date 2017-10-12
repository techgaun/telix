defmodule Telix.CDP.Connection do
  import Telix.Api

  def health_summary(client) do
    payload = %{
      "auth" => %{
        "sessionId" => client.session_key
      },
      "1" => %{
        "command" => "cdp.connection.health.summary"
      }
    }

    do_post "", payload
  end
end
