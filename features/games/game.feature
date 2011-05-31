Feature: Game
  In order to play Tic Tac Toe
  As a player
  I want to to create and load games

  Scenario: Create a game
    When I am on "Main Menu"
    And I follow "New Game"
    And I press "Create Game"
    Then I should be on the "Games Page"

  Scenario: Load a game
    Given an existing game
    When I am on "Main Menu"
    And I follow "Load Game"
    And I follow "Load"
    Then I should be on the "Games Page"

  Scenario: Plays out a game
    Given I am playing a game
    And I am on the "Games Page"
    And I press "move11"
    And I press "move12"
    And I press "move21"
    And I press "move13"
    And I press "move31"
    Then I should see "Player 1 wins!"

  Scenario: Destroys a game upon completion
    Given I am playing a game
    When I complete the game and player one wins
    And I press "Home"
    And I follow "Load Game"
    Then I should not see "Load"
