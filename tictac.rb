class Tic
    @@top = {:left, :center, :right}
    @@center = {:left => '4', :center => '5', :right => '6'}
    @@bottom = {:left => '7', :center => '8', :right => '9'}

    def initialize
        puts '#help > show all options'
        puts 'To start, #start_game'
    end

    public
    def start_game

    end

    def help
        puts '    #start_game  > start the game'
        puts '    #show_bard   > show current board'
        puts '    #show_score  > show current score'
    end

    def show_score

    end
    def show_board
        puts @@top.values.join(' | ')
        puts '---------'
        puts @@center.values.join(' | ')
        puts '---------'
        puts @@bottom.values.join(' | ')
    end    

    private 
    def change_turn

    end

    def input_position

    end


    def show_baord_with_numbers

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