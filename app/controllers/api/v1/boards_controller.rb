module Api::V1
  class BoardsController < ApplicationController
    def index
      render json: {
        status: 200,
        result: Game.new(Player::Human.new("X"), Player::Computer.new("O"), Board.new(Array.new(9)))
      }
    end
  end
end