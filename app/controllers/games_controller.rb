# frozen_string_literal: true

class GamesController < ApplicationController
    before_action :authenticate

    def create
        game_params = { first_player_id: @current_user.id, second_player_id: params[:opponent_id] }
        if ['f', 's'].sample == 's'
            game_params = { first_player_id: params[:opponent_id], second_player_id:  @current_user.id }
        end
        game = Games::CreatorService.call(game_params)
        game.save

        render(json: ({ in_game: true, game_state: game.state }))
    end

    def check_state
        game = @current_user.games&.last
        
        if game.blank? || game.over
            return render(json: ({ in_game: false, game_state: game.state }))
        end

        render(json: ({ in_game: !game.over, game_state: game.state, turn: game.is_current_turn(@current_user.id) ? 'You' : 'Opponent' }))
    end

    def turn
        game = @current_user.games&.last
        
        if game.blank? || game.over
            return render(json: ({ in_game: false }))
        end

        game = Games::TurnService.call(game: game, player: @current_user, location: {column: params[:column], row: params[:row]})
        game.save

        winner = Games::StateCheckerService.call(game: game)
        if winner
            if winner == '1'
                first_player = game.first_player
                first_player.win
                first_player.save
                second_player = game.second_player
                second_player.lose
                second_player.save
            else
                first_player = game.first_player
                first_player.lose
                first_player.save
                second_player = game.second_player
                second_player.win
                second_player.save
            end
            game.update(over: true)
        end

        render(json: ({ game_state: game.state, in_game: !game.over }))
    end
end
  