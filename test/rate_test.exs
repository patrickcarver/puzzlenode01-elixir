defmodule Puzzlenode01.Rates.RateTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.Rate

  test "create rate from map %{from: A, to: B, conversion: 0.5}" do
    map = %{from: "A", to: "B", conversion: 0.5}
    actual = Rate.create(map)
    expected = %Rate{from: "A", to: "B", conversion: 0.5}

    assert actual == expected
  end

  test "create inverse rate from %Rate{from: A, to: B, conversion: 0.5}" do
    rate = %Rate{from: "A", to: "B", conversion: 0.5}
    actual = Rate.inverse(rate)
    expected = %Rate{from: "B", to: "A", conversion: 2.0}

    assert actual == expected
  end

  test "is %Rate{from: A, to: B} inverse of %Rate{from: B, to: A}" do
    rate1 = %Rate{from: "A", to: "B", conversion: 0.5}
    rate2 = %Rate{from: "B", to: "A", conversion: 2.0}

    actual = Rate.is_inverse?(rate1, rate2)
    expected = true

    assert actual == expected
  end
end