require 'text/hyphen'

class Haiku < ActiveRecord::Base
  validate :validates_haiku_format

  # count the total number of syllables in a string
  # === Examples
  #   syllables_for('ruby')
  #   => 2
  #   syllables_for('')
  #   => 0
  #   syllables_for(nil)
  #   => 0
  def syllables_for(line)
    return 0 if line.blank?
    hyphenator = Text::Hyphen.new(:left => 1, :right => 1)
    syllables = 0
    line.split(' ').each do |word| 
      syllables += (hyphenator.hyphenate(word).size + 1)
    end
    return syllables
  end
  
  private
    # we're using 3-5-3 format!
    def validates_haiku_format
      errors.add(:line1, "must have 3 syllables") unless syllables_for(line1) == 3
      errors.add(:line2, "must have 5 syllables") unless syllables_for(line2) == 5
      errors.add(:line3, "must have 3 syllables") unless syllables_for(line3) == 3
    end
end
