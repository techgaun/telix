defmodule Telix.Endpoint do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      import Telix.Api
      import Telix.Util
    end
  end
end
