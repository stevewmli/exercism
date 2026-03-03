defmodule Garden do
  @default_students [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]
  @plants %{
    ?V => :violets, 
    ?C => :clover, 
    ?R => :radishes,
    ?G => :grass
  }
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_students) do
    Enum.sort(student_names)
    |> Enum.with_index
    |> Enum.reduce(%{}, fn({student, student_idx}, result) 
      -> Map.put_new(result, student, 
        get_student_plants(student_idx,  
          String.split(info_string, "\n"))) end )
  end

  defp get_student_plants(student_idx, [line1, line2]) do
    String.slice(line1, student_idx *2, 2) <> String.slice(line2, student_idx *2, 2)
    |> String.to_charlist
    |> Enum.reduce({}, fn(char, acc) -> Tuple.append(acc, Map.get(@plants, char)) end)
  end
end