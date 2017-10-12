defmodule Telix.Client do
  alias Telix.Util
  defstruct auth: nil, endpoint: Util.base_url(), session_key: nil

  @type auth :: %{user: binary, password: binary} | %{thing_key: binary, app_token: binary, app_id: binary}
  @type t :: %__MODULE__{auth: auth, endpoint: binary, session_key: binary}

  @spec new() :: t
  def new, do: %__MODULE__{}

  @spec new(auth) :: t
  def new(auth), do: %__MODULE__{auth: auth}

  @spec new(auth, binary) :: t
  def new(auth, endpoint), do: %__MODULE__{auth: auth, endpoint: endpoint}
end
