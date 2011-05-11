class AddGameIdToPlayerMove < ActiveRecord::Migration
  def self.up
    add_column :player_moves, :game_id, :integer
  end

  def self.down
  end
end
