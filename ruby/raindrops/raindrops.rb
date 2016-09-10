module BookKeeping
  VERSION = 2
end

class Raindrops
  SOUNDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong" 
  }

  def self.convert(num)
     result = SOUNDS.map { |prime, sound| sound if num % prime == 0 }.join  
     result.empty? ? num.to_s : result
  end
end