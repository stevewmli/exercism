defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
  	sorted_base = to_sorted_charlist(base)
  	Enum.filter(candidates, fn(item) -> 
  		item == base || sorted_base != to_sorted_charlist(item) end)
  end

  defp to_sorted_charlist(string) do
  	string
  	|> String.downcase()
  	|> String.to_charlist()
  	|> Enum.sort
  end
end