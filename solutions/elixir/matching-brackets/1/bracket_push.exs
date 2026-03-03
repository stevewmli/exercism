defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
  	[] == str
  	|> String.to_charlist
  	|> match_brackets([])  
  end

  defp match_brackets([], result) do
  	result
  end

  defp match_brackets([?(|t], result) do
  	match_brackets(t, [?(] ++ result)
  end

  defp match_brackets([?{|t], result) do
  	match_brackets(t, [?{] ++ result)
  end

  defp match_brackets([?[|t], result) do
  	match_brackets(t, [?[] ++ result)
  end

  defp match_brackets([?)|t], [?(|t2]) do
  	match_brackets(t, t2)
  end

  defp match_brackets([?}|t], [?{|t2]) do
  	match_brackets(t, t2)
  end

  defp match_brackets([?]|t], [?[|t2]) do
  	match_brackets(t, t2)
  end

  defp match_brackets([?)|t], result) do
  	[?)]
  end

  defp match_brackets([?}|t], result) do
  	[?}]
  end

  defp match_brackets([?]|t], result) do
  	[?]]
  end

  defp match_brackets([_|t], result) do
  	match_brackets(t, result)
  end
end