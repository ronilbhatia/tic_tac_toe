require 'byebug'
class HumanPlayer

  attr_accessor :name, :mark

  def initialize(name)
    @name = name
    @mark = :X
  end

  def display(board)
    @board = board
    display_board = board.grid.map do |row|
      row.map { |space| space || " " }
    end
    puts " #{display_board[0][0]} | #{display_board[0][1]} | #{display_board[0][2]} "
    puts "-----------"
    puts " #{display_board[1][0]} | #{display_board[1][1]} | #{display_board[1][2]} "
    puts "-----------"
    puts " #{display_board[2][0]} | #{display_board[2][1]} | #{display_board[2][2]} "
  end

  def get_move
    # ,debugger
    puts "Where would you like to place your marker? (row, col)"
    move = gets.chomp.delete(",!?+-/-. ").split("").map(&:to_i).map { |idx| idx - 1 }
    unless valid_move?(move)
      puts "Invalid move, please try again"
      move = get_move
    end

    move
  end

  def valid_move?(move)
    return false if move.any? { |num| num > 2 || num < 0 } || move.length > 2
    return false if !@board.empty?(move)
    true
  end

end
