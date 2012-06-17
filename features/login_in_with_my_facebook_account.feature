Feature: login in with my Facebook account
  In order to be able to import my financial transactions
  As an user
  I want to login in with my Facebook account

  @omniauth_test
  Scenario: 
    Given I am in the homepage
    When I click "Entrar via Facebook"
    Then I should see "Olá Nícolas Iensen"
    And I should not see the link "Entrar via Facebook"
