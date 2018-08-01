defmodule RctpTest do
  use ExUnit.Case
  doctest Rctp

  test "greets the world" do
    assert Rctp.hello() == :world
  end
end
