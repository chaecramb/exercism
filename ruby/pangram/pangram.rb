module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end

class Pangram
  ALPHA = [*("a".."z")]

  def self.is_pangram?(str)
    return false if str.empty?
    test_str = str.downcase

    ALPHA.reduce(false) {|_, l| test_str.include?(l) ? true : (return false)}
  end
end