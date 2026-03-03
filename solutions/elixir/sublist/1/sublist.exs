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
  	  partOf?(a, b) -> :sublist
  	  partOf?(b, a) -> :superlist
  	  true -> :unequal
  	end
  end

  def partOf?(l, []) do
  	false
  end

  def partOf?([], _) do
  	true
  end

  def partOf?([h1|t1], [h2|t2]) when h1 !== h2 do
  	partOf?([h1|t1], t2)
  end

  def partOf?([h1|t1], [h2|t2]) when h1 === h2 do
  	cond do
  	  t1 == Enum.slice(t2, 0, length(t1)) -> true
  	  true -> partOf?([h1|t1], t2)
  	end
  end
end