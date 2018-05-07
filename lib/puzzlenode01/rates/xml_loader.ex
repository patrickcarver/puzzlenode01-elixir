defmodule Puzzlenode01.Rates.XmlLoader do
  import SweetXml

  alias Puzzlenode01.File
  alias Puzzlenode01.Rates.Rate

  def call(file) do
    file
    |> File.load()
    |> clean_data()
    |> parse_to_xml()
    |> create_rates()
  end

  defp clean_data(string) do
    string 
    |> String.replace("\n", "")
    |> String.replace(" ", "")   
  end

  defp parse_to_xml(string) do
    map = string
          |> parse()
          |> xmap(rates: [
            ~x[//rates/rate]l,
            from: ~x[./from/text()]s,
            to: ~x[./to/text()]s,
            conversion: ~x[./conversion/text()]f
          ])

    map.rates       
  end

  defp create_rates(list) do
    Enum.map(list, &Rate.create/1)
  end
end