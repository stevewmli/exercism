defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    create_series(String.codepoints(s), size)
  end

  defp create_series(list, size) when size <= 0 or size > length(list) do
    []
  end

  defp create_series(list, size) do
    Enum.map(
      0..(Enum.count(list) - size),
      fn idx ->
        Enum.slice(list, idx, size)
        |> Enum.join()
      end
    )
  end
end
