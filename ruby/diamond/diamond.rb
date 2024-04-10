class Diamond
  def self.make_diamond(widest_letter)
    diamond = ""
    current_letter = "A"
    width = 1
    diamond << current_letter + "\n"
    
    until current_letter == widest_letter.next do
      puts current_letter
      current_letter = current_letter.next
    end
    diamond
  end

  private

  def alphabet_position(letter)
    letter.upcase.ord - 'A'.ord + 1
  end
end