defmodule TelixTest do
  use ExUnit.Case
  doctest Telix

  test "greets the world" do
    assert Telix.hello() == :world
  end
end
