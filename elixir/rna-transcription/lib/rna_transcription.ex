defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @transcriptchars %{'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn l -> @transcriptchars[[l]] end)
    |> Enum.concat()
  end
end
