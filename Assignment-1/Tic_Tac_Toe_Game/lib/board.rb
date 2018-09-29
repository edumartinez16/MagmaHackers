require './player.rb'

# Class to control the board
class Board
  def initialize
    # Creating 3 by 3 matrix
    @board = Array.new(3) { Array.new(3) }
    # Variable to count the turns during a game
    @turn = 0
  end

  # Fuction to fill the matrix with numbers from 1 to 9
  def fill_board
    @num = 1
    (0..2).each do |row|
      (0..2).each do |col|
        @board[row][col] = @num.to_s
        @num += 1
      end
    end
  end

  # Method to print the matrix in the console
  def print_board
    @board.each do |row|
      print row.to_s
      print "\n"
    end
  end

  # Function to change the number in the postion given as a parameter with the symbol of the current player
    def draw_symbol(position, symbol)
      @flag = false
      @board.each_index do |row|
        @board.each_index do |col|
          @value = @board[row][col]
          if @value == position
            @board[row][col] = symbol
            # Everytime the player draws a symbol @turn is incremented by one
            @turn += 1
            @flag = true
          end
        end
      end
      @flag
    end

  # Function to check the possible combinations of winning
  def check_win(symbol)
    if check_horizontal_comb(symbol) == true
      true
    elsif check_vertical_comb(symbol) == true
      true
    elsif check_diagonal_comb(symbol) == true
      true
    else
      false
    end
  end

  # Comparing the variable @turn with the number 9 which is the the limit of turns that players can have 
  def check_draw()
    @turn == 9
  end

  # Function to check if there is the same symbol in the positions of the board
  def check_horizontal_comb(symbol)
    if @board[0][0] == symbol && @board[1][0] == symbol && @board[2][0] == symbol || @board[0][1] == symbol && @board[1][1] == symbol && @board[2][1] == symbol || @board[0][2] == symbol && @board[1][2] == symbol && @board[2][2] == symbol
      true
    else
      false
    end
  end

  # Function to check if there is the same symbol in the positions of the board
  def check_vertical_comb(symbol)
    if @board[0][0] == symbol && @board[0][1] == symbol && @board[0][2] == symbol || @board[1][0] == symbol && @board[1][1] == symbol && @board[1][2] == symbol || @board[2][0] == symbol && @board[2][1] == symbol && @board[2][2] == symbol
      true
    else
      false
    end
  end

  # Function to check if there is the same symbol in the positions of the board
  def check_diagonal_comb(symbol)
    if @board[0][0] == symbol && @board[1][1] == symbol && @board[2][2] == symbol ||  @board[2][0] == symbol && @board[1][1] == symbol && @board[0][2] == symbol
      true
    else
      false
    end
  end
end

