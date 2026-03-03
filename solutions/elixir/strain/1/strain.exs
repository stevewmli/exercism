defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filter(list, fun, true, [])
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    filter(list, fun, false, [])
  end

  defp filter([], _fun, _expected, result) do
    result
  end

  defp filter([h | t], fun, expected, result) do
    if apply(fun, [h]) == expected do
      [h] ++ filter(t, fun, expected, result)
    else
      filter(t, fun, expected, result)
    end
  end
end
