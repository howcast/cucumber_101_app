require File.dirname(__FILE__) + '/../spec_helper'

describe Haiku, "number_of_lines validation" do    
  before do 
    @haiku = Haiku.new
  end
  
  it "should raise an error if there are less than 3 lines" do
    lambda { @haiku.save! }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should not raise an error if there are 3 lines" do
    @haiku.line1 = "one two three"
    @haiku.line2 = "four five six seven"
    @haiku.line3 = "eight nine ten"
    lambda { @haiku.save! }.should_not raise_error
  end
end

describe Haiku, "number_of_syllables validation" do    
  before do 
    @haiku = Haiku.new
    @haiku.line1 = "one two three"
    @haiku.line2 = "four five six seven"
    @haiku.line3 = "eight nine ten"
  end
  
  it "should raise an error if line 1 isn't 3 syllables" do
    @haiku.line1 = "one two"
    lambda { @haiku.save! }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should raise an error if line 2 isn't 5 syllables" do
    @haiku.line2 = "four"
    lambda { @haiku.save! }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should raise an error if line 3 isn't 3 syllables" do
    @haiku.line1 = "eight nine"
    lambda { @haiku.save! }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should not raise an error if we have an 11 syllable (3-5-3) haiku" do
    lambda { @haiku.save! }.should_not raise_error
  end
end

describe Haiku, "three_lines?" do    
  before do 
    @haiku = Haiku.new
    @haiku.line1 = "one two three"
    @haiku.line2 = "four five six seven"
    @haiku.line3 = "eight nine ten"
  end
  
  it "should return true if there are 3 lines" do
    @haiku.three_lines?.should be_true
  end
  
  it "should return false if there are not 3 lines" do
    @haiku.line3 = nil
    @haiku.three_lines?.should be_false
  end
end

describe Haiku, "syllables_for" do    
  before do 
    @haiku = Haiku.new
  end
  
  it "should return 3 for a line with 3 syllables" do
    @haiku.syllables_for("one two three").should == 3
  end
  
  it "should return 6 for a line with 6 syllables" do
    @haiku.syllables_for("visualize something").should == 6
  end
end
