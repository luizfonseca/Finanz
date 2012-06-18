Feature: import my financial transactions
  In order to automate my financial control
  As an user
  I want to import my financial transactions

  @omniauth_test
  Scenario: 
    Given I am logged in
    And I attach a file with 83 transactions into the form
    When I press "Importar"
    Then I should be in "this import page"
    And I should see "83 transações criadas"
