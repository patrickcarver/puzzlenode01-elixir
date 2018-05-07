defmodule Puzzlenode01.File do
  def load(file) do
    "../../assets/" <> file
    |> Path.expand(__DIR__)
    |> File.read!()   
  end
end