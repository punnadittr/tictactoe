class Tic

    EMPTY_BOARD = (1..9).to_a
    CONDITIONS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

    @@board = Array.new(9, ' ')

    @@player1_choice = Array.new
    @@player2_choice = Array.new

    def initialize
        show_empty_board
        start_game
    end

    public
    def show_board
        puts @@board[0..2].join(' | ')
        puts '---------'
        puts @@board[3..5].join(' | ')
        puts '---------'
        puts @@board[6..8].join(' | ')
        puts
        puts
    end    

    private 
    def start_game
        @game_over = false
        @userturn
        play_game
    end

    def show_empty_board
        puts 'Please enter your desired position as below'
        puts EMPTY_BOARD[0..2].join(' | ')
        puts '---------'
        puts EMPTY_BOARD[3..5].join(' | ')
        puts '---------'
        puts EMPTY_BOARD[6..8].join(' | ')
    end

    def play_game
        while @game_over != true 
            switch_turn
            puts @userturn + " 's Turn"
            @userinput = (gets.to_i) - 1
            if @@board[@userinput] == ' '
                @@board[@userinput] = @userturn
                @@player1_choice.push(@userinput.to_i + 1) if @userturn == 'X'
                @@player2_choice.push(@userinput.to_i + 1) if @userturn == 'O'
                show_board
                check_game_over
            else 
                puts 'Invalid Move'
                switch_turn
            end
        end
    end

    def switch_turn
        @userturn = (@userturn == 'X') ? 'O' : 'X'
    end

    def check_game_over
        if @@player1_choice.size >= 3 or @@player2_choice.size >= 3
            check_game_over_condition(@@player1_choice, @@player2_choice)
        end
    end

    def check_game_over_condition(choice_x, choice_o)
        CONDITIONS.each_index do |index|
            if CONDITIONS[index] & choice_x.sort == CONDITIONS[index] or
                CONDITIONS[index] & choice_o.sort == CONDITIONS[index]
                @game_over = true
                puts 'GAME OVER, ' + @userturn + ' Wins!'
                reset
            end
        end
    end

    def continue?
        puts "Play Again? (y/n)"
        continue = gets.chomp
        while continue != 'y' && continue != 'n'
            continue = gets.chomp
        end
        if continue == 'y'
            play_game
        elsif continue == 'n'
            exit
        end
    end

    def reset
        @@board = Array.new(9,' ')
        @@player1_choice = Array.new
        @@player2_choice = Array.new
        @game_over = false
        continue?
    end
end

Tic.new