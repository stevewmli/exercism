defmodule RNATranscription do
  @dna_to_rna %{
  	?A => ?U,
  	?C => ?G,
  	?T => ?A,
  	?G => ?C
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn(x) -> Map.get(@dna_to_rna, x, 0) end)
  end
end