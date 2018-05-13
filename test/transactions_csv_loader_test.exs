defmodule Puzzlenode01.Transactions.CsvLoaderTest do
  use ExUnit.Case

  alias Puzzlenode01.Transactions.{CsvLoader, Transaction}
  alias CSV

  test "load csv and get first transaction" do
    actual = "TRANS.csv" 
             |> CsvLoader.call() 
             |> List.first()

    expected = %Transaction{
                amount: 84.16, 
                currency: "CAD", 
                sku: "DM1759", 
                store: "Utica"
              }

    assert actual == expected
  end

end