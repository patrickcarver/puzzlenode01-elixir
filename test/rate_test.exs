defmodule Puzzlenode01.Rates.RateTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.Rate

  setup_all _context do
    {
      :ok, 
      rate:    %Rate{from: "A", to: "B", conversion: 0.5}, 
      inverse: %Rate{from: "B", to: "A", conversion: 2.0}
    }
  end

  test "create rate from map %{from: A, to: B, conversion: 0.5}", context do
    map = %{from: "A", to: "B", conversion: 0.5}
    actual = Rate.create(map)
    expected = context[:rate]

    assert actual == expected
  end

  test "create inverse rate from %Rate{from: A, to: B, conversion: 0.5}", context do
    actual = Rate.inverse(context[:rate])
    expected = context[:inverse]

    assert actual == expected
  end

  test "is %Rate{from: A, to: B} inverse of %Rate{from: B, to: A}", context do
    actual = Rate.are_inverse?(context[:rate], context[:inverse])
    expected = true

    assert actual == expected
  end

  test "find inverse from list of rates", context do
    list = [
      %Rate{from: "D", to: "C", conversion: 0.0},
      context[:inverse],
      %Rate{from: "C", to: "D", conversion: 0.0}
    ]

    actual = Rate.find_inverse(list, context[:rate])
    expected = context[:inverse]

    assert actual == expected
  end
end