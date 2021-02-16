class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def display_board
    @board
  end

  def input_to_index(user_input)
    converted_input = (user_input.to_i) - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " || @board[index] == "" || @board[index] == nil
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if position_taken?(index)
    else
    index.between?(0, 8)
    end
  end

  def turn_count
    counter = 0
    @board.each do |turns|
      if turns == "X" || turns == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      board[win[0]] == board[win[1]] &&
      board[win[1]] == board[win[2]] &&
      position_taken?(board, win[0])
    end
  end

  def full?
    @board.all?{|full| full == "X" || full == "O"}
  end

  def draw?
    if !won? && full?
      return true
    else won?
      return false
    end
  end

  def over?
    if draw? || won? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?(@board)[0]]
    end
  end
end
