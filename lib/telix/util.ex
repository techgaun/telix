defmodule Telix.Util do
  @moduledoc false
  @base_url "https://api.devicewise.com/api"

  def base_url do
    case config(:base_url) do
      url when is_binary(url) -> "#{url}"
      _ -> "#{@base_url}"
    end
  end

  def http_opts, do: config(:http_opts) || []
  def ua, do: config(:user_agent) || "Telix <https://github.com/techgaun/telix>"

  def req_header, do: [{"User-Agent", ua()}, {"Content-Type", "application/json"}]

  def config(key), do: Application.get_env(:telix, key)

  def build_payload(cmd) do
    %{
      "1" => %{
        "command" => cmd
      }
    }
  end

  def build_payload(cmd, params) do
    %{
      "1" => %{
        "command" => cmd,
        "params" => params
      }
    }
  end
end
