require_relative './player.rb'
require_relative './board.rb'

# Class for controlling the game
class Game
  def initialize
    # Creating and filling the board
    @board = Board.new
    @board.fillBoard()
    # Creating players for the game
    createPlayer1()
    createPlayer2()
    # Set the first player
    @active_player = @player1
  end

  # Function to request the name of the user
  # The name is stored in the variable name_player and then is returned
  def name
    puts 'Ingresa el nombre del jugador: '
    name_player = gets.chomp
    name_player
  end

  # Method to switch the current player
  # There is a comparison between the variable @active_player that contains the data of the current player with the data stored in the variable @player1
  def switch_player
    if @active_player == @player1
      @active_player = @player2
    else
      @active_player = @player1
    end
  end

  # This is the main method here all the functions of the game are called
  def start_game
    # Infinite loop
    while
      # Draw the board on the terminal
      @board.print_board
      # Ask the player to choose where to draw the symbol
      @active_player.choose_spot()
      # Check if the current player won
      if @board.check_win(@active_player.player_symbol)
        @board.print_board
        puts 'Has ganado'
        @active_player.setPlayerVictory()
        # Ask if the player wants to play again
        play_again
        # If not, the loop is broken
        break
      else
        # Check if there is a draw
        if @board.check_draw
          puts 'Empate'
          play_again
          break
        end
        # If there isn't a draw the game switch the current player
        switch_player
      end
    end
  end

  # Method to create the first player creating an instance of the class Player with the variable @player1
  def create_player1
    name = name
    symbol = 'X'
    # To create a new player the name of the player, the symbol which is going to use and the board is needed
    @player1 = Player.new(name, symbol, @board)
    puts "Simbolo: #{@player1.player_symbol}"
  end

  # Method to create the second player creating an instance of the class Player with the variable @player1
  def create_player2
    name = name
    symbol = 'Os'
    # To create a new player the name of the player, the symbol which is going to use and the board is needed
    @player2 = Player.new(name, symbol, @board)
    puts "Simbolo: #{@player2.player_symbol}"
  end

  # With this Function the game decide which player starts the game if they want to play again
  def check_last_winner
    if @player1.player_victory
      @player2
    elsif @player2.player_victory
      @player1
    else
      @player1
    end
  end

  # Method to repeat the game
  # The game gets which player won the last game and stored the last winner in the variable @active_player 
  def play_again
    puts '¿Quieres volver a jugar S/N'
    @answer = gets.chomp.downcase
    if @answer == 's'
      @active_player = check_last_winner
      # The game creates a new board and assigns it to the players
      @board = Board.new
      @board.fill_board
      @player1.board(@board)
      @player2.board(@board)
      # Then the game calls the function to star the game again
      startGame
    end
  end
end

tic = Game.new
tic.startGame