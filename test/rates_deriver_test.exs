defmodule Puzzlenode01.Rates.DeriverTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.{Deriver, Rate}

  setup_all do
    {
      :ok,
      forward: [
        %Rate{conversion: 0.9911, from: "USD", to: "CAD"},
        %Rate{conversion: 0.9921, from: "CAD", to: "AUD"},
        %Rate{conversion: 0.7439, from: "AUD", to: "EUR"}          
      ]
    }
  end

  test "ensure deriver calculates all possible rates", context do
    actual = context[:forward]
             |> Deriver.process_list()
             |> Enum.sort(&(&1.conversion <= &2.conversion))

    expected = [
      %Rate{conversion: 0.9911, from: "USD", to: "CAD"},
      %Rate{conversion: 0.9921, from: "CAD", to: "AUD"},
      %Rate{conversion: 0.7439, from: "AUD", to: "EUR"},
      %Rate{conversion: 0.98327031, from: "USD", to: "AUD"},
      %Rate{conversion: 0.731454783609, from: "USD", to: "EUR"},
      %Rate{conversion: 0.7380231899999999, from: "CAD", to: "EUR"}
    ] |> Enum.sort(&(&1.conversion <= &2.conversion))

    assert actual == expected
  end
end