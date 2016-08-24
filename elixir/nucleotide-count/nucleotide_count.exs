defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Raises an ArgumentError for an invalid strand.
  """
  def validate_strand!(strand) do
    Enum.each(strand, &validate_nucleotide!/1)
  end


  @doc """
  Raises an ArgumentError for an invalid nucleotide.
  """
  def validate_nucleotide!(nucleotide) do
    unless nucleotide in @nucleotides, do: raise ArgumentError
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
    validate_strand!(strand)
    validate_nucleotide!(nucleotide)

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
    validate_strand!(strand)

    nucleotides = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    for {n, _} <- nucleotides, into: %{}, do: {n, DNA.count(strand, n)}
  end
end
