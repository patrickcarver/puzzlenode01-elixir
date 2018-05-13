defmodule Puzzlenode01.Transactions.CsvLoader do
  alias Puzzlenode01.File
  alias Puzzlenode01.Transactions.Transaction

  def call(file) do
    file
    |> File.load_stream()
    |> CSV.decode(headers: true)
    |> Enum.map(&create_transaction/1)  
  end

  defp create_transaction({:ok, transaction}) do
    Transaction.create_from_map(transaction)
  end
end