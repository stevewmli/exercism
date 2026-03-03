defmodule Roman do
  @num_to_roman %{
  	1 		=> "I",
  	4     => "IV",
  	5 		=> "V",
  	9 		=> "IX",
  	10 		=> "X",
  	40 		=> "XL",
  	50 		=> "L",
  	90    => "XC",
  	100 	=> "C",
  	400   => "CD",
  	500 	=> "D",
  	900	  => "CM",
  	1000  => "M"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
  	build_numerals(Enum.sort(Map.keys(@num_to_roman), &(&1 > &2)), number, "")
  end

  defp build_numerals(_, num, result) when num == 0 do
   result
 end

 defp build_numerals([h | t], num, result) do
   build_numerals(t, rem(num, h), result <> String.duplicate(Map.get(@num_to_roman, h, 0), div(num, h)))
 end
end