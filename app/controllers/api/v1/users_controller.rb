module Api::V1
  class UsersController < ApplicationController
    def move
      input = params[:input]
      game_store = JSON.parse(cookies[:game])
      game = Game.new(Player::Human.new("X"), Player::Computer.new("O"), Board.new(game_store["board"]["cells"]))

      cells = game.turn(input)

      unless game.won?
        cells = game.turn
      end

      if game.won?
        render json: {
          status: 200,
          result: {
            cells: cells,
            final: "Win"
          }
        } and return
      end

      cookies[:game] = game.to_json
      render json: {
        status: 200,
        result: {
          cells: cells
        }
      }
    end
  end
end