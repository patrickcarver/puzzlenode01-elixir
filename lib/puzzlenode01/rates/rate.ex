defmodule Puzzlenode01.Rates.Rate do
  alias Puzzlenode01.Rates.Rate

  @enforce_keys [:from, :to, :conversion]
  defstruct(from: nil, to: nil, conversion: 0.0)

  def create(map) do
    %Rate{from: map.from, to: map.to, conversion: map.conversion}
  end

  def inverse(rate) do
    %Rate{from: rate.to, to: rate.from, conversion: (1 / rate.conversion)}
  end

end