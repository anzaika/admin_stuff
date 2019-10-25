defmodule AdminStuffTest do
  use ExUnit.Case
  doctest AdminStuff

  test "greets the world" do
    assert AdminStuff.hello() == :world
  end
end
