Feature: Activate Bomb
  In order to explode the bomb
  As a supervillain
  I want to be able to activate the bomb

  Scenario: Activating Bomb
    Given the bomb has been booted with activation code 0000
    When I enter the activation code 0000
    Then the bomb will be activated

  Scenario: Wrong Activation Code
    Given the bomb has been booted with activation code 0000
    When I enter the activation code 1111
    Then the bomb will not be activated
