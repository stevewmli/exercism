defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    isValidDnaSymbol(strand)
    isValidDnaSymbol([nucleotide]) 
    Stream.filter(strand, fn(x) -> x == nucleotide end) |> Enum.count
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    isValidDnaSymbol(strand)
    Enum.reduce(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn(s, result) -> Map.update!(result, s, &(&1 + 1)) end)
  end

  defp isValidDnaSymbol(symbols) do
    if (Stream.filter(symbols, fn(s) -> !Enum.member?(@nucleotides, s) end) |> Enum.count) != 0 do
      raise ArgumentError, message: "invalid dna symbol: [#{symbols}]"
    end
  end
end