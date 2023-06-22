# frozen_string_literal: true

module Games
  class TurnService
    def self.call(game:, player:, location:)
       return game if location[:row].blank? || location[:column].blank?

       return game if game.player_turn(player.id) != game.turn

      column = location[:column]
      row = location[:row]

      return game if !Helper.correctCoords(column: column, row: row) || game.state[row][column] != '0'

      game.state[row][column] = (game.turn == 'first' ? '1' : '2')

      game.toggle_turn
      
      game
    end
  end
end
