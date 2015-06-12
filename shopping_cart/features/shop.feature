Feature: Shopping with a cart
  In order to buy things
  As a shopper
  I want to be able to use my cart

  Scenario: Add to my cart
    Given I have a cart
    When I click "add to cart" on an item
    Then the item should be in my cart

  Scenario: Remove from my cart
    Given I am on the screen to view items in my cart
    When I click "remove item" on an item
    Then the item should be taken out from my cart

  Scenario: Estimate Shipping
    Given I am on the screen to view items in my cart
    And I have entered my shipping address into my cart
    When I click "estimate shipping"
    Then I should see a number representing cost of shipping

  Scenario: Incorrect Shipping Address
    Given I am on the screen to view items in my cart
    And I have entered my shipping address into my cart
    And I have entered an invalid address
    When I click "estimate shipping"
    Then I should see an error message indicating my address was not found

  Scenario: View Item from my cart
    Given I am on the screen to view items in my cart
    When I click "view item" on an item
    Then I should see the item's page
