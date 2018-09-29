require_relative './board.rb'

#Class for controlling the player
class Player
  def initialize(name, symbol, board)
    # Variable to store the name of the player
    @name = name
    # Variable to store the symbol of the player
    @symbol = symbol
    # Variable to check if the player won, always starts as false
    @winner = false
    # Variable to store the object board
    @board = board
  end

  # Fuction to obtain the player's symbol
  def player_symbol
    @symbol
  end

  def player_victory
    @winner
  end

  def victory
    @winner = true
  end

  # Function to draw the symbol of the player in the position that the player choose
  def choose_spot
    while true
      # Display message to the current player
      puts "Hola #{@name}, ingresa el número correspondiente al lugar donde quieres poner tu #{@symbol}"
      @number = gets.chomp.to_i
      # Compare if the @number is between 1 or 9
      if @number >= 1 && @number <= 9
        # If the symbol is drawn correctly the loop is broken
        if @board.draw_symbol(@number.to_s, @symbol)
          break
        end
      else
        puts 'Debes ingresar uno de los números que aparezca en el tablero'
      end
    end
  end
end