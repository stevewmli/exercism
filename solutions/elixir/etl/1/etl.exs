defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Map.to_list(input)
    |> Enum.flat_map(fn({key, words}) -> 
        Enum.map(words, fn(i) -> [String.downcase(i), key] end) 
      end)
    |> Enum.reduce(%{}, fn([word, key], acc) -> Map.put_new(acc, word, key) end)
  end
end