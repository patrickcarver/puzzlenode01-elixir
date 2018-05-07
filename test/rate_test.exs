defmodule Puzzlenode01.Rates.RateTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.Rate

  test "create rate from map %{from: A, to: B, conversion: 0.5}" do
    map = %{from: "A", to: "B", conversion: 0.5}
    actual = Rate.create(map)
    expected = %Rate{from: "A", to: "B", conversion: 0.5}

    assert actual == expected
  end
end