defmodule Puzzlenode01.Rounding do
  alias Decimal

  def call(value) do
    value
    |> Float.to_string()
    |> Decimal.round(4, :half_even)
    |> Decimal.to_float()
  end
end