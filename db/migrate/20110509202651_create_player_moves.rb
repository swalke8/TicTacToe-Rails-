class CreatePlayerMoves < ActiveRecord::Migration
  def self.up
    create_table :player_moves do |t|
      t.integer :row
      t.integer :column

      t.timestamps
    end
  end

  def self.down
    drop_table :player_moves
  end
end
