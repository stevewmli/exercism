defmodule ProteinTranslation do
  @protein_map %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) when rem(length(rna), 3) != 0 do
    {:error, "invalid RNA"}
  end


  def of_rna(rna) do
    rna
    |> String.split(~r/.{3}/, include_captures: true, trim: true)
    |> Enum.map(fn elm -> of_codon!(elm) end)
    |> output_rna()
  end

  defp output_rna(rna_list) do
    if Enum.member?(rna_list, nil) do
      {:error, "invalid RNA"}
    else
      {:ok, upto_stop(rna_list, [])}
    end
  end

  defp upto_stop([], result) do
    result
  end

  defp upto_stop([h | t], result) when h == "STOP" do
    result
  end

  defp upto_stop([h | t], result) do
    upto_stop(t, result ++ [h])
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    of_codon!(codon)
    |> output_codon()
  end

  defp of_codon!(codon) do
    Map.get(@protein_map, codon)
  end

  defp output_codon(nil) do
    {:error, "invalid codon"}
  end 

  defp output_codon(result) do
    {:ok, result}
  end 
end
