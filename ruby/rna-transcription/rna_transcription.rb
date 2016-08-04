module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end

class Complement

  DNA_TO_RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
  }

  def self.of_dna(strand)
    strand.split('').map do |nucleotide|
      complement = DNA_TO_RNA[nucleotide]
      complement || (return "") 
    end.join
  end 
end