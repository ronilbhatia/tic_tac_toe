require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :current_player, :player_one, :player_two

  def initialize(player_one, player_two)
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
  end

  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def play
    current_player.display(board)
    until board.over?
      play_turn
    end
    if game_winner
      puts "#{game_winner} wins!"
      player_one.display(board)
    else
      puts "Cats game!"
      player_one.display(board)
    end

  end

  def game_winner
    return player_one.name if board.winner == player_one.mark
    return player_two.name if board.winner == player_two.mark
    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(HumanPlayer.new("Ronil"), ComputerPlayer.new("Computer"))
  game.play
end
