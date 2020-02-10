class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even?  ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != nil
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn(input = nil)
    input = current_player.move(board).to_i if input.blank?
    if board.valid_move?(input.to_s)
      board.update(input, current_player)
      return board.cells
    elsif input.between?(1, 9) == false
      return false
    else
      return false
    end
  end
end