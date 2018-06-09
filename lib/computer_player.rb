class ComputerPlayer
  attr_accessor :name, :mark, :board

  def initialize(name)
    @name = name
    @mark = :O
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        moves << pos if board.empty?(pos)
      end
    end

    moves.each do |move|
      return move if wins?(move)
    end

    moves.sample
  end

  def wins?(move)
    board.place_mark(move, mark)
    if board.over?
      board.place_mark(move, nil)
      return true
    else
      board.place_mark(move, nil)
      false
    end
  end

end
