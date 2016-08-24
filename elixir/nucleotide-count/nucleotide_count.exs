defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  def valid_strand?(strand) do
    length(Enum.filter(strand, &valid_nucleotide?/1)) == length(strand)
  end

  def valid_nucleotide?(nucleotide) do
    Enum.member?(@nucleotides, nucleotide)
  end

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

    count_matches = fn 
      n, acc -> if n == nucleotide, do: acc + 1, else: acc 
    end

    case {strand, nucleotide} do
      {'', _} -> 0
      {strand, _} -> List.foldl(strand, 0, count_matches)
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    unless valid_strand?(strand), do: raise ArgumentError

    nucleotides = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    for {n, _} <- nucleotides, into: %{}, do: {n, DNA.count(strand, n)}
  end
end
