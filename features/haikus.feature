Feature: Creating Haikus
	
	Scenario: Trying to create a haiku in the wrong format
		Given I am on the new haiku page
		And there are no haikus
		When I fill in "haiku[line1]" with "one two"
		And I fill in "haiku[line2]" with "four five six"
		And I fill in "haiku[line3]" with "eight nine"
		And I press "Submit"
    Then I should see "Line1 must have 3 syllables"
    And I should see "Line2 must have 5 syllables"
    And I should see "Line3 must have 3 syllables"
		And there should be 0 haikus
    
	Scenario: Trying to create a haiku in the correct format
		Given I am on the new haiku page
		And there are no haikus
    When I fill in "haiku[line1]" with "one two three"
    And I fill in "haiku[line2]" with "four five six seven"
    And I fill in "haiku[line3]" with "eight nine ten"
    And I press "Submit"
    Then I should be on the haikus page
    And I should see "one two three"
		And there should be 1 haiku
    
