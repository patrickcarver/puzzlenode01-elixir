defmodule Puzzlenode01.Rates.ListCreatorTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.{ListCreator, Rate}

  test "create list of rates" do
    actual = ListCreator.call("RATES.xml") 
             |> Enum.sort(&(&1.conversion <= &2.conversion))

    expected = [
      %Rate{conversion: 0.9911, from: "USD", to: "CAD"},
      %Rate{conversion: 0.9921, from: "CAD", to: "AUD"},
      %Rate{conversion: 0.7439, from: "AUD", to: "EUR"},
      %Rate{conversion: 0.98327031, from: "USD", to: "AUD"},
      %Rate{conversion: 0.731454783609, from: "USD", to: "EUR"},
      %Rate{conversion: 0.7380231899999999, from: "CAD", to: "EUR"},
      %Rate{conversion: 1.009,  from: "CAD", to: "USD"},
      %Rate{conversion: 1.0079,  from: "AUD", to: "CAD"},
      %Rate{conversion: 1.3442, from: "EUR", to: "AUD"},
      %Rate{conversion: 1.0169711,  from: "AUD", to: "USD"},
      %Rate{conversion: 1.3670125526199999,  from: "EUR", to: "USD"},
      %Rate{conversion: 1.35481918, from: "EUR", to: "CAD"}
    ] |> Enum.sort(&(&1.conversion <= &2.conversion))

    assert actual == expected          
  end
end