class Tic

    EMPTY_BOARD = (1..9).to_a
    CONDITIONS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

    @@board = {'top' => {'left' => ' ', 'center' => ' ', 'right' => ' '},
    'center' => {'left' => ' ', 'center' => ' ', 'right' => ' '},
    'bottom' => {'left' => ' ', 'center' => ' ', 'right' => ' '}}

    @@player1_choice = Array.new
    @@player2_choice = Array.new

    def initialize
        show_empty_board
        start_game
    end

    public
    def start_game
        @userturn
        switch_turn
        play_game
    end
    

    def help
        puts '    #start_game  > start the game'
        puts '    #show_bard   > show current board'
        puts '    #show_score  > show current score'
    end

    def show_score

    end

    def show_board
        puts @@board['top'].values.join(' | ')
        puts '---------'
        puts @@board['center'].values.join(' | ')
        puts '---------'
        puts @@board['bottom'].values.join(' | ')
        puts
        puts
    end    

    private 

    def show_empty_board
        puts 'Please enter your desired position as below'
        puts EMPTY_BOARD[0..2].join(' | ')
        puts '---------'
        puts EMPTY_BOARD[3..5].join(' | ')
        puts '---------'
        puts EMPTY_BOARD[6..8].join(' | ')
    end

    def play_game
        @userinput = gets.chomp
        case @userinput
        when '1'
            @@board['top']['left'] = @userturn
        when '2'
            @@board['top']['center'] = @userturn
        when '3'
            @@board['top']['right'] = @userturn
        when '4'
            @@board['center']['left'] = @userturn
        when '5'
            @@board['center']['center'] = @userturn
        when '6'
            @@board['center']['right'] = @userturn
        when '7'
            @@board['bottom']['left'] = @userturn
        when '8'
            @@board['bottom']['center'] = @userturn
        when '9'
            @@board['bottom']['right'] = @userturn
        else 
            puts 'Invalid INPUT'
        end
        @@player1_choice.push(@userinput.to_i) if @userturn == 'X'
        @@player2_choice.push(@userinput.to_i) if @userturn == 'O'
        show_board
        check_game_over
    end

    def switch_turn
        if @userturn == 'X'
            @userturn = 'O'
        else 
            @userturn = 'X'
        end
    end

    def check_game_over
        if @@player1_choice.size >= 3
            CONDITIONS.each_index do |index|
                if (CONDITIONS[index] & @@player1_choice.sort) == CONDITIONS[index]
                    puts 'GAME OVER, PLAYER 1 Wins!'
                    reset
                end
            end
        end
    end
    def reset
        @@board = {'top' => {'left' => ' ', 'center' => ' ', 'right' => ' '},
        'center' => {'left' => ' ', 'center' => ' ', 'right' => ' '},
        'bottom' => {'left' => ' ', 'center' => ' ', 'right' => ' '}}
        @@player1_choice = Array.new
        @@player2_choice = Array.new
    end
end
    


=begin
puts 'Welcome to the game, please enter your names'
puts 'Enter Player One Name: '
@player1 = gets.chomp
puts 'Enter Player Two Name: '
@player2 = gets.chomp

puts `'#{@player1} , do you want X or O ?'`
player1_choice = gets.chomp
if player1_choice == 'x' or 'X'
    puts `'#{@player1} is X, #{@player2} is O'`
else 
    puts `'#{@player1} is O, #{@player2} is X'`
en
end
=end