defmodule Telix.Client do
  alias Telix.Util
  import Telix.Api
  defstruct auth: nil, endpoint: Util.base_url(), session_key: nil

  @type auth :: %{username: binary, password: binary} | %{thingKey: binary, appToken: binary, appId: binary}
  @type t :: %__MODULE__{auth: auth, endpoint: binary, session_key: binary}

  @spec new() :: t
  def new, do: %__MODULE__{}

  @spec new(atom) :: t
  def new(:config), do: %__MODULE__{auth: Util.config(:auth)}

  @spec new(auth) :: t
  def new(auth), do: %__MODULE__{auth: auth}

  @spec new(auth, binary) :: t
  def new(auth, endpoint), do: %__MODULE__{auth: auth, endpoint: endpoint}


  @spec login(t) :: t
  def login(client) do
    payload = %{
      auth: %{
        command: "api.authenticate",
        params: client.auth
      }
    }

    case do_post "", payload do
      {:ok, %{"auth" => %{"params" => %{"sessionId" => session_key}}}} ->
        %{client | session_key: session_key}

      _ -> client
    end
    # rest/auth example
    # case do_post "rest/auth", {:form, client.auth} do
    #   {:ok, key} when is_binary(key) ->
    #     %{client | session_key: key}
    #
    #   _ -> client
    # end
  end
end
