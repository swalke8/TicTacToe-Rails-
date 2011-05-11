class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :player_one
      t.integer :player_two

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
