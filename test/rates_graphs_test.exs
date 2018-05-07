defmodule Puzzlenode01.Rates.GraphsTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.Graphs

  test "create new struct" do
    actual = %Graphs{}
    expected = %Graphs{forward: [], reverse: [], known_rates: []}

    assert actual == expected
  end
end