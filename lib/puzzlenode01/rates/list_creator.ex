defmodule Puzzlenode01.Rates.ListCreator do
  alias Puzzlenode01.Rates.{Deriver, Graphs, InverseGrouper, XmlLoader}

  def call(xml_file) do
    xml_file
    |> XmlLoader.call()
    |> InverseGrouper.call()
    |> Graphs.create()
    |> Deriver.process_graphs()
  end
end