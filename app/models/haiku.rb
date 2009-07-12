require 'text/hyphen'

class Haiku < ActiveRecord::Base
  validate :number_of_lines
  validate :number_of_syllables

  def three_lines?
    !line1.blank? && !line2.blank? && !line3.blank?
  end
  
  def syllables_for(line)
    hyphenator = Text::Hyphen.new(:left => 1, :right => 1)
    count = 0
    line.split(' ').each { |word|
      count += (hyphenator.hyphenate(word).size + 1)
    }
    count
  end
  
  private
    def number_of_lines
      errors.add_to_base("Must be 3 lines") unless three_lines?
    end
  
    def number_of_syllables
      if three_lines?
        errors.add_to_base("Line 1 must have 3 syllables") unless syllables_for(line1) == 3
        errors.add_to_base("Line 2 must have 5 syllables") unless syllables_for(line2) == 5
        errors.add_to_base("Line 3 must have 3 syllables") unless syllables_for(line3) == 3
      end
    end
end
