defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
  	match_chars(base, to_sorted_charlist(base), candidates, [])
  end

  defp match_chars(_, _, [], result) do
  	result
  end

  defp match_chars(base, sorted_base, [h|t], result) do
  	if base != String.downcase(h) &&
  		sorted_base == to_sorted_charlist(h) do
  		match_chars(base, sorted_base, t, result ++ [h])
  	else
  		match_chars(base, sorted_base, t, result)
  	end
  end

  defp to_sorted_charlist(string) do
  	string
  	|> String.downcase()
  	|> String.to_charlist()
  	|> Enum.sort
  end
end