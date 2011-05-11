class AddValueToPlayerValue < ActiveRecord::Migration
  def self.up
    add_column :player_moves, :value, :integer
  end

  def self.down
  end
end
