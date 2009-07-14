require File.dirname(__FILE__) + '/../spec_helper'

describe Haiku, ".valid?" do
  before do 
    @haiku = Haiku.new
    @haiku.line1 = 'line1'
    @haiku.line2 = 'line2'
    @haiku.line3 = 'line3'
    @haiku.stub!(:syllables_for)
  end

  it "should have an error if line1 doesn't have the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line1').and_return(1)
    @haiku.should have(1).error_on(:line1)
  end
  
  it "should NOT have errors if line1 has the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line1').and_return(3)
    @haiku.should have(:no).errors_on(:line1)    
  end
  
  it "should have an error if line2 doesn't have the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line2').and_return(1)
    @haiku.should have(1).error_on(:line2)
  end
  
  it "should NOT have errors if line2 has the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line2').and_return(5)
    @haiku.should have(:no).errors_on(:line2)
  end

  it "should have an error if line3 doesn't have the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line3').and_return(1)
    @haiku.should have(1).error_on(:line3)
  end
  
  it "should NOT have errors if line3 has the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line3').and_return(3)
    @haiku.should have(:no).errors_on(:line3)
  end

  it "should be valid if all lines have the right number of syllables" do
    @haiku.should_receive(:syllables_for).with('line1').and_return(3)
    @haiku.should_receive(:syllables_for).with('line2').and_return(5)
    @haiku.should_receive(:syllables_for).with('line3').and_return(3)
    @haiku.valid?.should be_true
  end
end

describe Haiku, "syllables_for" do    
  before do 
    @haiku = Haiku.new
  end

  it "should work for 3 syllables" do
    @haiku.syllables_for('ruby time').should == 3
  end

  it "should work for 5 syllables" do
    @haiku.syllables_for('ruby gems are red').should == 5
  end
  
  it "should return 0 for nil" do
    @haiku.syllables_for(nil).should == 0
  end

  it "should return 0 for blank lines" do
    @haiku.syllables_for('').should == 0
  end

  it "should work for 4 syllables" do
    @haiku.syllables_for('this better work').should == 4
  end
end
