When /^I am on the (.+) page $/ do |page|
  visit path_to(page)
end

Given /^an existing game$/ do
  Game.create!(:player_one => 1, :player_two => 1)
end

Given /^I am playing a game$/ do
  @game = Game.create!(:player_one => 1, :player_two => 1)
  visit "/move/load?game=#{@game.id}"
end

When /^I complete the game and player one wins$/ do
  @game.add_player_move(1,1,1)
  @game.add_player_move(1,2,-1)
  @game.add_player_move(2,1,1)
  @game.add_player_move(1,3,-1)
  @game.add_player_move(3,1,1)
  visit "/move/index?game=#{@game.id}"
end
