defmodule Puzzlenode01.Rates.XmlLoader do
  import SweetXml

  alias Puzzlenode01.File

  def call(file) do
    file
    |> File.load()
    |> clean_data()
  end

  defp clean_data(string) do
    string 
    |> String.replace("\n", "")
    |> String.replace(" ", "")   
  end

  defp parse_to_xml(string) do
    string
    |> parse()
    |> xmap(rates: [
      ~x[//rates/rate]l,
      from: ~x[./from/text()]s,
      to: ~x[./to/text()]s,
      conversion: ~x[./conversion/text()]f
    ])       
  end
end