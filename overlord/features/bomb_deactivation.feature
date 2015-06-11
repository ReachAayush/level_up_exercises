Feature: Deactivate Bomb
  In order to turn off the bomb
  As a supervillain
  I want to be able to deactivate the bomb

  Scenario: Deactivate with Default Code
    Given the bomb is booted without a custom deactivation code
    And the bomb is activated
    When I deactivate the bomb with code 0000
    Then the bomb will be deactivated

  Scenario: Deactivate with Custom Code
    Given the bomb is booted with a deactivation code of 5555
    And the bomb is activated
    When I deactivate the bomb with code 5555
    Then the bomb will be deactivated

  Scenario: Incorrect Deactivation Code
    Given the bomb is booted without a custom deactivation code
    And the bomb is activated
    When I deactivate the bomb with code 1234 2 times
    Then the bomb will still be active

  Scenario: Bomb Exploded
    Given the bomb is booted without a custom deactivation code
    And the bomb is activated
    When I deactivate the bomb with code 1234 3 times
    Then the bomb will explode
