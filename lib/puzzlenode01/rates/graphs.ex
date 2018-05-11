defmodule Puzzlenode01.Rates.Graphs do
  alias __MODULE__

  defstruct(forward: [], reverse: [])

  def create(inverse_groups) do
    process(%Graphs{}, inverse_groups)
  end

  # finish
  def process(graphs, []) do
    graphs
  end

  # start
  def process(graphs = %Graphs{forward: [], reverse: []}, [head | tail]) do
    {first, second} = head

    updated_graphs = graphs
                     |> Map.put(:forward, [first])
                     |> Map.put(:reverse, [second])

    process(updated_graphs, tail)
  end

  # iterate
  def process(graphs, [head | tail]) do
    {first, second} = head
    {first_location, second_locaton} = get_locations(graphs, first)

    updated_graphs = graphs 
                     |> update_graphs(first, first_location) 
                     |> update_graphs(second, second_locaton)

    updated_inverse_groups = update_inverse_groups([head | tail], first_location)

    process(updated_graphs, updated_inverse_groups)
  end

  def update_inverse_groups([head | tail], {_, nil}) do
    tail ++ [head]
  end

  def update_inverse_groups([_ | tail], {_, _}) do
    tail
  end

  def update_graphs(graphs, rate, {selected, :front}) do
    Map.put(graphs, selected, [rate | graphs[selected]])
  end

  def update_graphs(graphs, rate, {selected, :back}) do
    Map.put(graphs, selected, graphs[selected] ++ [rate])
  end

  def update_graphs(graphs, _, {_, nil}) do
    graphs
  end

  def get_locations(graphs, first) do
    forward = get_ends(graphs.forward)
    reverse = get_ends(graphs.reverse)

    cond do
      forward.first_from == first.to ->
        {{:forward, :front}, {:reverse, :back}}
      forward.last_to == first.from ->
        {{:forward, :back}, {:reverse, :front}}
      reverse.first_from == first.to -> 
        {{:reverse, :front}, {:forward, :back}}
      reverse.last_to == first.from ->
        {{:reverse, :back}, {:forward, :front}}
      true -> 
        {{:reverse, nil}, {:forward, nil}}
    end    
  end

  def get_ends(list) do
    first = List.first(list)
    last = List.last(list)
    %{first_from: first.from, last_to: last.to}
  end
end