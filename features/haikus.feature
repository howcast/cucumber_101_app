Feature: Haikus
  As a composer
  I want to share my 11 syllable (3-5-3) haiku poems
 
  Scenario: Incorrect format
    Given I am on the new haiku page
    When I fill in "haiku[line1]" with "one two"
    And I fill in "haiku[line2]" with "four five six" 
    And I fill in "haiku[line3]" with "eight nine"
    And I press "Submit"
    Then I should see "Line 1 must have 3 syllables"
    And I should see "Line 2 must have 5 syllables"
    And I should see "Line 3 must have 3 syllables"
      
  Scenario: Valid poem
    Given I am on the new haiku page
    When I fill in "haiku[line1]" with "one two three"
    And I fill in "haiku[line2]" with "four five six seven"
    And I fill in "haiku[line3]" with "eight nine ten"
    And I press "Submit"
    Then I should be on the haikus page
    And I should see "one two three"
    