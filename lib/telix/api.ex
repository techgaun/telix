defmodule Telix.Api do
  use HTTPoison.Base
  alias Telix.Parser
  import Telix.Util

  @doc false
  def build_url(path, params) do
    "#{base_url()}/#{path}?#{URI.encode_query(params)}"
  end

  @doc false
  def do_get(path, params) when is_map(params) do
    do_request(:get, path, params, "")
  end

  @doc false
  def do_get(path, params) when is_list(params) do
    do_get(path, Enum.into(params, %{}))
  end

  def do_post(path, body \\ %{})

  @doc false
  def do_post(path, body) when is_list(body) do
    do_post(path, Enum.into(body, %{}))
  end

  def do_post(path, {:form, map}) when is_map(map) do
    do_post(path, {:form, Enum.into(map, [])})
  end

  def do_post(path, {:form, _} = body) do
    do_request(:post, path, %{}, body)
  end

  @doc false
  def do_post(path, body) do
    do_request(:post, path, %{}, Poison.encode!(body))
  end

  @doc false
  def do_put(path, body \\ %{}) do
    do_request(:put, path, %{}, Poison.encode!(body))
  end

  def do_patch(path, body \\ %{})

  @doc false
  def do_patch(path, body) when is_list(body) do
    do_patch(path, Enum.into(body, %{}))
  end
  @doc false
  def do_patch(path, body) do
    do_request(:patch, path, %{}, Poison.encode!(body))
  end

  @doc false
  def do_delete(path) do
    do_request(:delete, path)
  end

  @doc false
  def do_delete(path, params) do
    do_request(:delete, path, params)
  end

  defp do_request(method, path, params \\ %{}, req_body \\ "") do
    uri = build_url(path, params)
    method
    |> HTTPoison.request(uri, req_body, req_header(), http_opts())
    |> Parser.parse()
  end
end
