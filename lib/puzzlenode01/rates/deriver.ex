defmodule Puzzlenode01.Rates.Deriver do
  alias Puzzlenode01.Rates.Rate

  def process_graphs(graphs) do
    process_list(graphs.forward) ++ process_list(graphs.reverse)
  end

  def process_list(rates) do
    loop(rates, rates)
  end

 def loop(queue = [head | tail], rates) when length(queue) > 1 do
   updated_rates = update_rates(head, tail, rates)  
   loop(tail, updated_rates) 
 end

 def loop(queue, rates) when length(queue) == 1 do
   rates
 end

 def update_rates(acc, list = [head | tail], rates) when length(list) > 0 do
   conversion = acc.conversion * head.conversion
   new_rate = %Rate{from: acc.from, to: head.to, conversion: conversion}
   updated_rates = [new_rate | rates]
   update_rates(new_rate, tail, updated_rates)      
 end  

 def update_rates(_, list, rates) when length(list) == 0 do
   rates
 end    
end