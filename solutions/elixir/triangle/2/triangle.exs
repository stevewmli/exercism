defmodule Triangle do
	@type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
  	{ :error, "all side lengths must be positive" }
  end

  def kind(a, b, c) do
  	[v1, v2, v3] = [a, b, c] |> Enum.sort
  	_kind(v1, v2, v3)
  end


  def _kind(a, a, a) do
  	{ :ok, :equilateral }
  end

  def _kind(b, a, a) when a * 2 <= b do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def _kind(_, a, a) do
  	{ :ok, :isosceles }
  end

  def _kind(b, c, a) when a > b and a > c and a >= b + c do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(_, _, _) do
  	{ :ok, :scalene }
  end
end