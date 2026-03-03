defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l, 0)
  end

  # helper
  defp _count([], counter) do
    counter
  end

  defp _count([_ | t], counter) do
    _count(t, counter + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  # helper
  def _reverse([], result) do
    result
  end

  def _reverse([h | t], result) do
    _reverse(t, [h | result])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f, []) |> reverse
  end

  # helper
  defp _map([], _, result) do
    result
  end

  defp _map([h | t], f, result) do
    _map(t, f, [f.(h)| result])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f, []) |> reverse
  end

  # helper
  defp _filter([], _, result) do
    result
  end

  defp _filter([h | t], f, result) do
    _filter(t, f, if (f.(h)) do [h | result] else result end)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _) do
    acc
  end

  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reverse(_append(b, reverse(a)))
  end

  # helper
  defp _append([], acc) do
    acc
  end

  defp _append([h | t], acc) do
    _append(t, [h | acc])
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(_concat(ll, []))
  end

  # helper
  defp _concat([], acc) do
    acc
  end

  defp _concat([h | t], acc) do
    _concat(t, _append(h, acc))
  end
end