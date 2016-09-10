module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Hamming

  def self.compute(strand_1, strand_2)
    unless strand_1.size == strand_2.size
      raise ArgumentError.new('strands must be of the same length')
    end
      
    strand_1.split('').zip(strand_2.split('')).reduce(0) do |mutations, nucs|
      mutations + (nucs[0] == nucs[1] ? 0 : 1)
    end
  end

end