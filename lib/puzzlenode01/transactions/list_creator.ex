defmodule Puzzlenode01.Transactions.ListCreator do
  def load_target(transactions, %{sku: sku, currency: currency}) do
    transactions 
    |> Enum.filter(&(&1.sku == sku && &1.currency == currency))
  end
end