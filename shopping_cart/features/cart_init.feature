Feature: Shopping Cart Initialization
  In order to shop
  As a person with money
  I want to be able to create a shopping cart

  Scenario: Enter Personal Info
    Given I am on the screen to create my cart
    When I enter my info
    Then My cart should have my info stored

  Scenario: Empty Cart
    Given: I am on the screen to create my cart
    When I click "create cart"
    Then My cart should be created and empty
