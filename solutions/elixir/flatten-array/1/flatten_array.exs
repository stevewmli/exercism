defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) when is_list(list) do
    Enum.reduce(list, [], fn(x, acc) -> acc ++ flatten(x) end)
  end

  def flatten(element) when element == nil do
    []
  end 

  def flatten(element) do
    [element]
  end
end