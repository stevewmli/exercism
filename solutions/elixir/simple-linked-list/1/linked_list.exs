defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    len(list, 0)
  end

  defp len({}, count) do
    count
  end

  defp len({_, next}, count) do
    len(next, count + 1)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    list == {}
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({}) do
    {:error, :empty_list}
  end

  def peek({value, _}) do
    {:ok, value}
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({}) do
    {:error, :empty_list}
  end

  def tail({_, next}) do
    {:ok, next}
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({}) do
    {:error, :empty_list}
  end

  def pop({value, next}) do
    {:ok, value, next}
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    Enum.reverse(list) 
    |> Enum.reduce(new(), fn(elem, acc) -> push(acc, elem) end)
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    to_l(list, []) |> Enum.reverse
  end

  defp to_l({}, result) do
    result
  end

  defp to_l({value, next}, result) do
    to_l(next, List.insert_at(result, 0, value))
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    to_r(list, new())
  end

  defp to_r({}, result) do
    result
  end

  defp to_r({value, next}, result) do
    to_r(next, push(result, value))
  end
end