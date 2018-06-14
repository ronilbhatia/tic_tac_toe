class ComputerPlayer
  attr_accessor :name, :mark, :board

  def initialize(name)
    @name = name
    @mark = :O
  end

  def display(board)
    @board = board
  end

  def find_moves
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        moves << pos if @board.empty?(pos)
      end
    end

    moves
  end

  def get_move
    moves = find_moves
    moves.each { |move| return move if wins?(move) }
    moves.each { |move| return move if blocks_win?(move) }
    return [1, 1] if @board.empty?([1, 1])
    moves.sample
  end

  def wins?(move)
    @board.place_mark(move, mark)
    if @board.over?
      @board.place_mark(move, nil)
      return true
    else
      @board.place_mark(move, nil)
      false
    end
  end

  def blocks_win?(move)
    @board.place_mark(move, :X)
    if @board.over?
      @board.place_mark(move, nil)
      return true
    else
      @board.place_mark(move, nil)
      false
    end
  end

end
