class MinesweeperGame
  
  attr_accessor :board

  def initialize(board, rows, columns)
    @board = board
    @rows = rows
    @columns = columns
    @game_over = false
  end

  def print_the_board
    @rows.times do |row|
      @columns.times do |column|
        if !@board["(#{row}, #{column})"].been_played
          print "[ ] "
        else
          print "[" + @board["(#{row}, #{column})"].adjacent_bombs.to_s + "] "
        end
      end
      puts 
    end
  end

  def play_the_game
    puts "Please put two numbers corresponding to the row and column that you'd like to play in the form"
    puts "<row>, <column>"
    puts
    player_choice = gets.chomp

    # Now match the player response with a regular expression
    while /(\d), (\d)$/.match(player_choice) == nil
      puts "Please put two numbers corresponding to the row and column that you'd like to play in the form"
      puts "<row>, <column>"
      puts
      player_choice = gets.chomp
    end
    match = /(\d), (\d)$/.match(player_choice)    
    play_tile(match[1], match[2])
    print_the_board
  end

  def play_tile(row, column)
    if @board["(#{row}, #{column})"].is_bomb?
      @game_over = true
    else
      @board["(#{row}, #{column})"].been_played = true
    end
  end
  
  def game_over?
    @game_over
  end
  
end

