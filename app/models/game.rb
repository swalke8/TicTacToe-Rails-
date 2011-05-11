class Game < ActiveRecord::Base
  validates_presence_of :player_one, :player_two

  has_many :player_moves

  def add_move(row, column, value)
    PlayerMove.create!(:row => row, :column => column, :value => value)
  end
end
