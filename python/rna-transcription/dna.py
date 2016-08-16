def to_rna(dna):
  dna_to_rna = {
    'C': 'G',
    'G': 'C',
    'A': 'U',
    'T': 'A'
  }

  return ''.join([dna_to_rna[nucleutide] for nucleutide in dna])