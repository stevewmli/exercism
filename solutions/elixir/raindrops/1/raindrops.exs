defmodule Raindrops do
  @factor_to_raindrop %{ 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    factors(number) 
    |> composeRaindrops(number)
  end

  defp composeRaindrops(list, num)  do
    cond do
      (list == list -- [3, 5, 7]) -> Integer.to_string(num)
      true -> list
              |> Enum.sort
              |> Enum.filter(fn(num) -> Enum.member?([3, 5, 7], num) end)
              |> Enum.map(fn(num) -> Map.get(@factor_to_raindrop, num) end)
              |> Enum.join  
    end
  end

  defp factors(num) do
    divisors_of(num, 1, [])
  end 

  defp divisors_of(num, n, result) when n * n > num do
    result
  end

  defp divisors_of(num, n, result) when n * n == num do
    [n | result]
  end

  defp divisors_of(num, n, result) when rem(num, n) == 0  do
    divisors_of(num, n+1, [n, div(num, n) | result])
  end

  defp divisors_of(num, n, result) do
    divisors_of(num, n + 1, result)
  end
end