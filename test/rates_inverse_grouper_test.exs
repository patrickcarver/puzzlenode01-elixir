defmodule Puzzlenode01.Rates.InverseGrouperTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.{InverseGrouper, Rate}

  test "group rates into list of inverse pairs" do
    rates = [
      %Rate{from: "AUD", to: "CAD", conversion: 1.0079},
      %Rate{from: "AUD", to: "EUR", conversion: 0.7439},
      %Rate{from: "CAD", to: "AUD", conversion: 0.9921},
      %Rate{from: "CAD", to: "USD", conversion: 1.0090},
      %Rate{from: "EUR", to: "AUD", conversion: 1.3442},
      %Rate{from: "USD", to: "CAD", conversion: 0.9911}
    ]

    actual = InverseGrouper.call(rates)
    expected = [
      {
        %Rate{from: "CAD", to: "USD", conversion: 1.0090},
        %Rate{from: "USD", to: "CAD", conversion: 0.9911}
      },
      {
        %Rate{from: "AUD", to: "EUR", conversion: 0.7439},
        %Rate{from: "EUR", to: "AUD", conversion: 1.3442}
      },
      {
        %Rate{from: "AUD", to: "CAD", conversion: 1.0079},
        %Rate{from: "CAD", to: "AUD", conversion: 0.9921} 
      }
    ]

    assert actual == expected
  end
end