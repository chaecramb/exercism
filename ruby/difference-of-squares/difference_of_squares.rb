module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Squares
  attr_reader :val

  def initialize(n)
    @val = n
  end

  def square_of_sum
    val == 0 ? val : 1.upto(val).reduce(:+)**2
  end

  def sum_of_squares
    (1..val).to_a.reduce(0) { |acc, n| acc + n**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end