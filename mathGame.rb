# create class that generates questions
# keep question and answer in the MathQuestion
# this is the only class that interacts with the user (puts/chomps)

class MathQuestion

  #CODE FOR P1 #instance vars so that we can access num1 and num 2 outside the class
  attr_reader :num1, :num2, :ans
  def initialize
    @num1 = rand(21)
    @num2 = rand(21)
    @ans = @num1 + @num2
  end
 
 
  def questionGen player
  
    puts "#{player.name}: What does #{num1} + #{num2} equal?"
    print "> " 
  end
#end this here
end


#players class to keep track of players and score?
class Player

  attr_accessor :lives, :name
  def initialize(name)
    @name = name
    @lives = 3
  end

end


#want a games class to run the game . i.e. while userLife > 0  
class PlayGame 

  attr_accessor :current_player
  def initialize
    @current_player = 1
  end

  def run_game
  # player1 = new instance of class Player with 3 lives
  player1 = Player.new('player1')
  player2 = Player.new('player2')
  # puts "LIVES HERE #{x.lives}"
  game = true
  while game do

    if @current_player == 3
      @current_player = 1
    end
    
    # want a way to access the lives attribute and alter it
    if (player1.lives == 0 || player2.lives == 0) 
      puts "GAME OVER"
    end 

    if @current_player == 1
      newQ = MathQuestion.new()
      newQ.questionGen(player1)
      
      result = $stdin.gets.chomp.to_i

      if newQ.ans == result
        puts "Yes, you are correct." 
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        puts "-------------NEW TURN---------------"
        else
        puts "Seriously, no!"  
        player1.lives -= 1    
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        puts "-------------NEW TURN---------------"
        
        if player1.lives == 0
          puts "#{player2.name} wins with a score of #{player2.lives}/3"
          puts "#{player1.name} has lost. Bye!"
          game = false
          return
        end
      
      end


      else
      
        newQ = MathQuestion.new()
        newQ.questionGen(player2)

        result = $stdin.gets.chomp.to_i

        if newQ.ans == result
          puts "Yes, you are correct."
          puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
          puts "-------------NEW TURN---------------"
        else
          puts "Seriously, no!"
          puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
          puts "-------------NEW TURN---------------"
          
          player2.lives -= 1 
         
          if player2.lives == 0
            puts "#{player1.name} wins with a score of #{player1.lives}/3"
            puts "#{player2.name} has lost. Bye!"
            game = false
            return
          end
        
        end

    end  
    
    @current_player += 1
    
  end   
  

  # we want to call the MathQuestions class wile both players have atleast 1 life
  # and call it for the player who's turn it is  
  # puts "What does #{num1} + #{num2} equal?"
  # print "> "
end

end

newGame = PlayGame.new()

newGame.run_game



 
