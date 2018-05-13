defmodule Puzzlenode01.Transactions.Transaction do
  alias __MODULE__

  @enforce_keys [:amount, :currency, :sku, :store]
  defstruct(amount: nil, currency: nil, sku: nil, store: nil)

  def create_from_map(map) do
    [amount, currency] = String.split(Map.get(map, "amount"))
    %Transaction{
      amount: String.to_float(amount),
      currency: currency,
      sku: Map.get(map, "sku"),
      store: Map.get(map, "store")
    }
  end
end