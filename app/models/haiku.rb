require 'text/hyphen'

class Haiku < ActiveRecord::Base
  validate :number_of_syllables
  
  def syllables_for(line)
    hyphenator = Text::Hyphen.new(:left => 1, :right => 1)
    syllables = 0
    line.split(' ').each do |word| 
      syllables += (hyphenator.hyphenate(word).size + 1)
    end
    return syllables
  end
  
  private
    def number_of_syllables
      errors.add_to_base("Line 1 must have 3 syllables") unless syllables_for(line1) == 3
      errors.add_to_base("Line 2 must have 5 syllables") unless syllables_for(line2) == 5
      errors.add_to_base("Line 3 must have 3 syllables") unless syllables_for(line3) == 3
    end
end
