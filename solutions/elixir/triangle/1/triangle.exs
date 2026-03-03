defmodule Triangle do
	@type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
  	{ :error, "all side lengths must be positive" }
  end

  def kind(a, a, a) do
  	{ :ok, :equilateral }
  end

  def kind(a, a, b) when a * 2 <= b do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(a, b, a) when a * 2 <= b do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(b, a, a) when a * 2 <= b do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(a, a, b) do
  	{ :ok, :isosceles }
  end

  def kind(a, b, a) do
  	{ :ok, :isosceles }
  end

  def kind(b, a, a) do
  	{ :ok, :isosceles }
  end

  def kind(a, b, c) when a > b and a > c and a >= b + c do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(c, a, b) when a > b and a > c and a >= b + c do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(b, c, a) when a > b and a > c and a >= b + c do
  	{ :error, "side lengths violate triangle inequality" }
  end

  def kind(a, b, c) do
  	{ :ok, :scalene }
  end
end