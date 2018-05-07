defmodule Puzzlenode01.FileTest do
  use ExUnit.Case

  alias Puzzlenode01.File

  test "" do
    actual = File.load("RATES.xml")
    expected = "<rates>\n  <rate>\n    <from>AUD</from>\n    <to>CAD</to>\n    <conversion>1.0079</conversion>\n  </rate>\n  <rate>\n    <from>AUD</from>\n    <to>EUR</to>\n    <conversion>0.7439</conversion>\n  </rate>\n  <rate>\n    <from>CAD</from>\n    <to>AUD</to>\n    <conversion>0.9921</conversion>\n  </rate>\n  <rate>\n    <from>CAD</from>\n    <to>USD</to>\n    <conversion>1.0090</conversion>\n  </rate>\n  <rate>\n    <from>EUR</from>\n    <to>AUD</to>\n    <conversion>1.3442</conversion>\n  </rate>\n  <rate>\n    <from>USD</from>\n    <to>CAD</to>\n    <conversion>0.9911</conversion>\n  </rate>\n</rates>"

    assert actual == expected
  end
end