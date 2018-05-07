defmodule Puzzlenode01Test do
  use ExUnit.Case
  doctest Puzzlenode01

  alias Puzzlenode01

  test "run project" do
    assert Puzzlenode01.run() == :ok
  end
end
