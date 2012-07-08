Feature: check the incoming vs. outgoing of the current month
  In order to keep track of my money
  As a
  I want to check the incoming vs. outgoing of the current month

  @omniauth_test
  Scenario: there is no incoming or outgoing for this month
    Given I am logged in
    And I have 5000 of incoming last month
    And I have 800 of outgoing last month
    When I go to "the homepage"
    Then I should see "R$ 0,00" of incoming
    And I should see "R$ 0,00" of outgoing

  @omniauth_test
  Scenario: there is incoming and outgoing for this month
    Given I am logged in
    And I have 5000 of incoming this month
    And I have 800 of outgoing this month
    When I go to "the homepage"
    Then I should see "R$ 5.000,00" of incoming
    Then I should see "-R$ 800,00" of outgoing
