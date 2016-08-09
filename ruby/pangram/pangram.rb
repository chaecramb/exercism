module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end

class Pangram
  ALPHABET = [*("a".."z")]

  def self.is_pangram?(sentence)
    sentence = sentence.downcase
    ALPHABET.all?{|c| sentence.include?(c)}
  end
end