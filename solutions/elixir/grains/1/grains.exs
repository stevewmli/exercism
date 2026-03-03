defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number >= 1 and number <= 64 do
    {:ok, power(number, 1)}
  end
  
  def square(_number) do
    { :error, "The requested square must be between 1 and 64 (inclusive)" }
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    {:ok, Enum.reduce(1..64, 0, fn(i, acc) -> acc + power(i,1) end)}
  end

  defp power(1, result) do
    result
  end

  defp power(number, result) do
    power(number - 1, result * 2)
  end
end