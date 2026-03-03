defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    find_prime(2, 1, count)
  end

  def find_prime(_, _, count) when count < 1 do
    raise "cannot find #{count} prime"
  end

  def find_prime(n, current, count) when current == count do
    n
  end

  def find_prime(n, current, count) do
    if is_prime(n + 1) do
      find_prime(n + 1, current + 1, count)
    else
      find_prime(n + 1, current, count)
    end
  end

  defp is_prime(n) when n < 2 do
    raise "cannot determine"
  end

  defp is_prime(n) do
  	is_prime_search(2, n)
  end

  defp is_prime_search(d, n) when d * d > n do
  	true
  end

  defp is_prime_search(d, n) when rem(n, d) == 0 do
  	false
  end

  defp is_prime_search(d, n) when rem(n, d) != 0 do
  	is_prime_search(d + 1, n)
  end
end