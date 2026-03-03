defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
  	Enum.reduce(factors, [], 
  		fn(x, acc) -> acc ++ list_multipes_to_limit(x, limit, 1, []) end)
  	|> Enum.uniq() 
  	|> Enum.sum()
  end

  defp list_multipes_to_limit(factor, limit, multipler, list) when factor * multipler < limit do
  	list_multipes_to_limit(factor, limit, multipler + 1, list ++ [factor * multipler] )
  end

  defp list_multipes_to_limit(_, _, _, list) do
  	list
  end
end