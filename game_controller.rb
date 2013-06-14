require_relative 'flashcards'
require_relative 'filemanager'
require 'cowsay'

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
      display_question(flashcard) 
      puts "Answer: "
      user_answer = gets.chomp
      return if user_exit?(user_answer)
      if check_answer(user_answer, flashcard) == true
        puts "Correct!!! You're a decent human being."
        puts
        increment_correct_attempts(flashcard) #method call
      else
        puts "Incorrect, you are not worthy of love."
        puts
        increment_wrong_attempts(flashcard)
        redo
      end
    end
  end

  def increment_wrong_attempts(flashcard)
    flashcard.wrong_attempts = flashcard.wrong_attempts + 1
  end

  def increment_correct_attempts(flashcard)
    flashcard.correct_attempts = flashcard.correct_attempts + 1
  end

  def display_question(flashcard)
    puts "Question:"
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
