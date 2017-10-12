defmodule Telix.SessionState do
  @moduledoc """
  A simple Agent implementation to store the session key
  and potentially other stuff in future for the API
  """

  @doc false
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @doc false
  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  @doc false
  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  @doc false
  def get_all do
    Agent.get(__MODULE__, &(&1))
  end
end
