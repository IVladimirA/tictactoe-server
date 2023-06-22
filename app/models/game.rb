# frozen_string_literal: true

class Game < ApplicationRecord
  validates :first_player_id, presence: true
  validates :second_player_id, presence: true
  validates :state, presence: true

    belongs_to :first_player, class_name: "User", foreign_key: "first_player_id"
    belongs_to :second_player, class_name: "User", foreign_key: "second_player_id"

    def toggle_turn
      self.turn = (self.turn == 'first' ? 'second' : 'first')
    end

    def player_turn(player_id)
        return 'first' if player_id == first_player_id
        return 'second' if player_id == second_player_id
        'undefined'
    end

    def is_current_turn(player_id)
      self.player_turn(player_id) == self.turn
  end
end
  