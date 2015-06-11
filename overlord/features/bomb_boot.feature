Feature: Boot Bomb
  In order to user the bomb
  As a supervillain
  I want to be able to to boot the bomb

  Scenario: Boot with Default Code
    Given I am on the boot screen
    When the bomb is booted with default codes
    Then The bomb should be ready to be activated

  Scenario: Boot with custom codes
    Given I am on the boot screen
    When the bomb is booted with activation code 1111 and deactivation code 2222
    Then the bomb should be ready to be activated with the code 1111 and deactivated with the code 2222
