# use 'ruby tictactoe.rb' to run
class TicTacToe
  EMPTY_BOARD = (1..9).to_a
  CONDITIONS = [
    [1,2,3], [4,5,6], [7,8,9], 
    [1,4,7], [2,5,8], [3,6,9], 
    [1,5,9], [3,5,7]
  ]
  
  def initialize
    @board = Array.new(9, ' ')
    @player1_choice = []
    @player2_choice = []
    puts 'Please enter your desired position as below'
    puts
    show_board(EMPTY_BOARD)
    start_game
  end

  private

  def start_game
    @game_over = false
    @userturn
    play_game
  end

  def show_board(type)
    puts type[0..2].join(' | ').center(35)
    puts '---------'.center(35)
    puts type[3..5].join(' | ').center(35)
    puts '---------'.center(35)
    puts type[6..8].join(' | ').center(35)
    puts
  end

  def play_game
    while @game_over != true
      switch_turn
      puts
      puts (@userturn + "'s Turn").center(35)
      @userinput = gets.to_i - 1
      if @board[@userinput] == ' '
        @board[@userinput] = @userturn
        @player1_choice.push(@userinput.to_i + 1) if @userturn == 'X'
        @player2_choice.push(@userinput.to_i + 1) if @userturn == 'O'
        show_board(@board)
        check_game_over
      else
        puts 'Invalid Move'.center(35)
        switch_turn
      end
    end
  end

  def switch_turn
    @userturn = @userturn == 'X' ? 'O' : 'X'
  end

  def check_game_over
    if @player1_choice.size >= 3 || @player2_choice.size >= 3
      check_game_over_condition(@player1_choice, @player2_choice)
    end
    tie?
  end

  def check_game_over_condition(choice_x, choice_o)
    CONDITIONS.each_index do |index|
      if CONDITIONS[index] & choice_x.sort == CONDITIONS[index] || 
         CONDITIONS[index] & choice_o.sort == CONDITIONS[index]
        @game_over = true
        puts ('GAME OVER, ' + @userturn + ' Wins!').center(35)
        reset
      end
    end
  end

  def tie?
    if @board.all? { |x| x != ' ' }
      puts 'TIE'.center(35); reset
    end
  end

  def continue?
    puts "Play Again? (y/n)".center(35)
    continue = gets.chomp
    while continue != 'y' && continue != 'n'
      continue = gets.chomp
    end
    if continue == 'y'
      show_board(@board)
      play_game
    elsif continue == 'n'
      exit
    end
  end

  def reset
    @board = Array.new(9,' ')
    @player1_choice = []
    @player2_choice = []
    @game_over = false
    continue?
  end
end

TicTacToe.new
