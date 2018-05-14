defmodule Puzzlenode01.Transactions.ListCreatorTest do
  use ExUnit.Case

  alias Puzzlenode01.Transactions.{ListCreator, Transaction}

  test "get list where sku = DM1759 and currency = CAD" do
    actual = [
              %Transaction{store: "Utica", sku: "DM1759", amount: 84.16, currency: "CAD"},
              %Transaction{store: "Toronto", sku: "DM1759", amount: 50.00, currency: "CAD"},
              %Transaction{store: "Calgary", sku: "DM1759", amount: 100.00, currency: "CAD"},
              %Transaction{store: "Berlin", sku: "DM1000", amount: 100.00, currency: "EUR"},
              %Transaction{store: "Canberra", sku: "DM1729", amount: 100.00, currency: "AUD"},
              %Transaction{store: "Nashville", sku: "DM1999", amount: 100.00, currency: "USD"}
             ] 
             |> ListCreator.load_target(%{sku: "DM1759", currency: "CAD"})

    expected = [
                %Transaction{store: "Utica", sku: "DM1759", amount: 84.16, currency: "CAD"},
                %Transaction{store: "Toronto", sku: "DM1759", amount: 50.00, currency: "CAD"},
                %Transaction{store: "Calgary", sku: "DM1759", amount: 100.00, currency: "CAD"}
               ]

    assert actual == expected
  end
end