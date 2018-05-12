defmodule Puzzlenode01.Rates.InverseGrouper do
  alias Puzzlenode01.Rates.{Rate}

  def call(rates) do
    process(rates, [])
  end

  def process([], inverses) do
    inverses
  end

  def process([rate | tail], inverses) do
    inverse_rate = find_inverse(tail, rate)

    updated_inverses = [{rate, inverse_rate} | inverses]
    updated_rates = List.delete(tail, inverse_rate)

    process(updated_rates, updated_inverses)
  end

  def find_inverse(tail, rate) do
    inverse_rate = Rate.find_inverse(tail, rate)

    case inverse_rate do
      nil -> 
        Rate.inverse(rate)
      _ ->
        inverse_rate
    end
  end
end