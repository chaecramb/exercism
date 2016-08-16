def distance(strand1, strand2):
  return sum(1 for pair in zip(strand1, strand2) if pair[0] != pair[1])