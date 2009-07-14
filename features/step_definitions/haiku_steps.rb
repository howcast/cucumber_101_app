Given /^there are no haikus$/ do
  Haiku.delete_all
end

Then /^there should be (\d+) haikus?/ do |count|
  Haiku.count.should == count.to_i
end
