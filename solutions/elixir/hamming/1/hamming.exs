defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
  	compare(strand1, strand2)
  end

  defp compare(strand1, strand2) when length(strand1) != length(strand2) do
  	{:error, "Lists must be the same length"}
  end

  defp compare(strand1, strand2) when strand1 == strand2 do
  	{:ok, 0}
  end

  defp compare(strand1, strand2) do
  	count_diff(strand1, strand2, 0)
  end

  defp count_diff([], [], count) do
  	{:ok, count}
  end

  defp count_diff([h1|t1], [h2|t2], count) when h1 != h2 do
  	count_diff(t1, t2, count + 1)
  end

  defp count_diff([_|t1], [_|t2], count) do
  	count_diff(t1, t2, count)
  end
end