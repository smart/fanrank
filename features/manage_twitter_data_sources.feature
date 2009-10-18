Feature: Manage Twitter Data Sources

  Scenario: Register new Twitter Data Sources
    Given I am on the new Twitter Data Sources page
    When I fill out the form with valid information
    And I press "Create"
    Then I should see "Thrillist Brand Tracker"

  Scenario: Delete Twitter Data Sources
    Given I have a Twitter Data Source "Thrillist Brand Tracker"
    And I am on the Twitter Data Sources page
    And I follow "Thrillist Brand Tracker"
    When I follow "delete"
    # And confirm that I want to delete the data source
    Then I should be on the Twitter Data Sources page
    And not see "Thrillist Brand Tracker" data source

  Scenario: View a twitter data sources top fans
    Given I have a Twitter Data Source "Thrillist Brand Tracker"
    And  Profiles for 10 Twitter Data Sources fans
    When I am on the "Thrillist" Twitter Data Sources page
    Then I should see the top fans ordered by scores

  Scenario: Edit a Twitter Data Source
    Given I have a Twitter Data Source "Thrillist Brand Tracker"
    And I am on the Twitter Data Sources page
    And I follow "Thrillist Brand Tracker"
    When I follow "edit"
    When I rename the source "Thrillist Event Tracker"
    And I press "Update"
    Then I should see "Thrillist Event Tracker"
