defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
  	sentence
  	|> String.replace(" ", "")
  	|> String.replace("-", "")
  	|> String.to_charlist()
  	|> Enum.sort()
  	|> Enum.chunk_by(fn(char) -> char end)
  	|> Enum.map(fn(arg) -> Enum.count(arg) end)
  	|> Enum.filter(fn(arg) -> arg > 1 end)
  	|> Enum.count() == 0
  end

end