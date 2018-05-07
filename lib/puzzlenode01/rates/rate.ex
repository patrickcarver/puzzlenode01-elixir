defmodule Puzzlenode01.Rates.Rate do
  alias Puzzlenode01.Rates.Rate
  alias Puzzlenode01.Rounding

  @enforce_keys [:from, :to, :conversion]
  defstruct(from: nil, to: nil, conversion: 0.0)

  def create(map) do
    %Rate{from: map.from, to: map.to, conversion: map.conversion}
  end

  def inverse(rate) do
    %Rate{
      from: rate.to, 
      to: rate.from, 
      conversion: inverse_conversion(rate.conversion)
    }
  end

  def are_inverse?(original_rate, candidate_rate) do
    original_rate.from == candidate_rate.to && 
    original_rate.to == candidate_rate.from
  end

  def find_inverse(list, rate) do
    Enum.find(list, &are_inverse?(&1, rate))
  end

  defp inverse_conversion(conversion) do
    Rounding.call(1 / conversion)
  end
end