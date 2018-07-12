defmodule Telix.Api do
  use HTTPoison.Base
  alias Telix.Parser
  import Telix.Util

  def do_post(body, client \\ nil)

  @doc false
  def do_post(body, client) when is_list(body) do
    do_post(Enum.into(body, %{}), client)
  end

  def do_post({:form, map}, client) when is_map(map) do
    do_post({:form, Enum.into(map, [])}, client)
  end

  def do_post({:form, _} = body, _client) do
    do_request(:post, body)
  end

  def do_post(body, client) do
    body =
      if is_nil(client) or is_nil(client.session_key) do
        body
      else
        Map.put(body, "auth", %{"sessionId" => client.session_key})
      end

    do_request(:post, Poison.encode!(body))
  end

  defp do_request(method, req_body) do
    uri = base_url()

    method
    |> HTTPoison.request(uri, req_body, req_header(), http_opts())
    |> Parser.parse()
  end
end
