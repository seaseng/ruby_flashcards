require_relative 'flashcards'
require_relative 'filemanager'

class Game_controller

  attr_reader :flashcard_array
  def initialize(flashcard_array)
    @flashcard_array = flashcard_array
  end

  def run_game!

    flashcard_array.each do |flashcard|
      display_question(flashcard) 
      puts "Answer: "
      user_answer = gets.chomp
      return if user_exit?(user_answer)
      if check_answer(user_answer, flashcard) == true
        puts "Correct!!! You're a decent human being."
      else
        puts "Incorrect, you are not worthy of love."
        redo
      end
    end
    
  end

  def display_question(flashcard)
    puts "Question"
    puts flashcard.question
  end

  def check_answer(user_answer, flashcard)
    user_answer == flashcard.answer
  end

  def user_exit?(user_answer)
    user_answer.downcase == 'quit' || user_answer.downcase == 'exit' || user_answer.downcase == "\n"
  end



    
end

file_manager = FileManager.new
# test = Flashcard.new("How do you feel?", "good")
game = Game_controller.new(file_manager.flashcards)
game.run_game!
