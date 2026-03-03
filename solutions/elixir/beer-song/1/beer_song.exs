defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    """
    #{to_display(number - 1)} of beer on the wall, #{String.downcase(to_display(number - 1))} of beer.
    #{action(number - 1)}, #{String.downcase(to_display(number - 2))} of beer on the wall.
    """
  end

  defp to_display(number) when number == 0 do
    "No more bottles"
  end

  defp to_display(number) when number < 0 do
    "99 bottles"
  end

  defp to_display(number) when number == 1 do
    "#{number} bottle"
  end

  defp to_display(number) do
    "#{number} bottles"
  end

  defp action(number) when number == 1 do
    "Take it down and pass it around"
  end

  defp action(number) when number <= 0 do
    "Go to the store and buy some more"
  end

  defp action(_) do
    "Take one down and pass it around"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    (for n <- range, do: verse(n)) |> Enum.join("\n")
  end
end