class Game_controller

  attr_reader :flashcard_array
  def initialize(flashcard_array)
    @flashcard_array = flashcard_array
  end

  def run_game!

    puts "Welcome to Ruby Flashcards.  Remember you're not smart."
    puts "Enter 'exit' or 'quit' to terminate program at anytime."
    puts
    go_through_flashcard_deck #method to iterate through flashcard deck
    
  end


  def go_through_flashcard_deck
    flashcard_array.shuffle.each do |flashcard|
      flashcard.display_question
      puts "Answer: "
      user_answer = gets.chomp
      if user_exit?(user_answer)
        @flashcard_array.sort_by! { |flashcard| flashcard.wrong_attempts }.reverse!
        return
      end
      if flashcard.check_answer(user_answer) == true
        puts "Correct!!! You're a decent human being."
        puts
        flashcard.increment_correct_attempts #method call
      else
        puts "Incorrect, you are not worthy of love."
        puts

        flashcard.increment_wrong_attempts
        puts "Number of attempts: #{flashcard.wrong_attempts}"
        if flashcard.wrong_attempts > 3
          puts "You're too dumb, moving on."
          next #skips the rest of the loop and starts at beginning of loop (each)
        else
          redo #retries the current iteration of the loop
        end
      end
    end
  end

  

  def user_exit?(user_answer)
    user_answer.downcase == 'quit' || user_answer.downcase == 'exit' || user_answer.downcase == "\n"
    
  end



    
end

# file_manager = FileManager.new
# # test = Flashcard.new("How do you feel?", "good")
# game = Game_controller.new(file_manager.flashcards)
# game.run_game!
