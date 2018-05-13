defmodule Puzzlenode01.File do
  def load(file) do
    "../../assets/" <> file
    |> Path.expand(__DIR__)
    |> File.read!()   
  end

  def load_stream(file) do    
    "../../assets/" <> file
    |> Path.expand(__DIR__)
    |> File.stream!()
  end

#  defp get_file(file) do
#    "../../assets/" <> file
#    |> Path.expand(__DIR__)    
#  end
end