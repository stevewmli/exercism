defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b do
  	:equal
  end

  def compare(a, b) do
  	cond do
  	  is_sublist?(a, b) -> :sublist
  	  is_sublist?(b, a) -> :superlist
  	  true -> :unequal
  	end
  end

  def is_sublist?(l, []) do
  	false
  end

  def is_sublist?([], _) do
  	true
  end

  def is_sublist?([h1|t1], [h2|t2]) when h1 !== h2 do
  	is_sublist?([h1|t1], t2)
  end

  def is_sublist?([h1|t1], [h2|t2]) when h1 === h2 do
  	cond do
  	  t1 == Enum.take(t2, length(t1)) -> true
  	  true -> is_sublist?([h1|t1], t2)
  	end
  end
end