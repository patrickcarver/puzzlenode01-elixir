defmodule Puzzlenode01.RoundingTest do
  use ExUnit.Case

  alias Puzzlenode01.Rounding

  test "bankers' rounding" do
      expected = 4.3624

      assert Rounding.call(4.36235) == expected
      assert Rounding.call(4.36245) == expected
  end
end