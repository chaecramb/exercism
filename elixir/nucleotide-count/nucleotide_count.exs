defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless valid_strand?(strand) and valid_nucleotide?(nucleotide) do 
      raise ArgumentError
    end

    Enum.count(strand, &(&1 == nucleotide))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    for n <- @nucleotides, into: %{}, do: {n, DNA.count(strand, n)}
  end

  defp valid_strand?(strand) do
    Enum.all?(strand, &valid_nucleotide?/1)
  end

  defp valid_nucleotide?(nucleotide) do
    nucleotide in @nucleotides
  end
end
