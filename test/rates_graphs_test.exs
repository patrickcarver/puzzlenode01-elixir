defmodule Puzzlenode01.Rates.GraphsTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.{Graphs, Rate}

  test "create new struct" do
    actual = %Graphs{}
    expected = %Graphs{forward: [], reverse: []}

    assert actual == expected
  end

  test "create graphs" do
    inverse_groups = [
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

    actual = Graphs.create(inverse_groups)

    expected = 
      %Graphs{
        forward: [
          %Rate{from: "EUR", to: "AUD", conversion: 1.3442},
          %Rate{from: "AUD", to: "CAD", conversion: 1.0079},
          %Rate{from: "CAD", to: "USD", conversion: 1.0090}
        ],
        reverse: [
          %Rate{from: "USD", to: "CAD", conversion: 0.9911},
          %Rate{from: "CAD", to: "AUD", conversion: 0.9921},
          %Rate{from: "AUD", to: "EUR", conversion: 0.7439}
        ]
      }

    assert actual == expected
  end


end