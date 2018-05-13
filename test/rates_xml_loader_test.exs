defmodule Puzzlenode01.Rates.XmlLoaderTest do
  use ExUnit.Case

  alias Puzzlenode01.Rates.{Rate, XmlLoader}

  test "load xml file and return list of rates" do
    actual = XmlLoader.call("RATES.xml")
    expected = [
      %Rate{from: "AUD", to: "CAD", conversion: 1.0079},
      %Rate{from: "AUD", to: "EUR", conversion: 0.7439},
      %Rate{from: "CAD", to: "AUD", conversion: 0.9921},
      %Rate{from: "CAD", to: "USD", conversion: 1.0090},
      %Rate{from: "EUR", to: "AUD", conversion: 1.3442},
      %Rate{from: "USD", to: "CAD", conversion: 0.9911}
    ]

    assert actual == expected
  end
end
