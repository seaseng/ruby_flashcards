# Main file for 

class Flashcard
  attr_reader :question, :answer
  attr_accessor :wrong_attempts, :correct_attempts

  def initialize(question, answer, wrong_attempts=0, correct_attempts=0)

    @question = question
    @answer = answer
    @wrong_attempts = wrong_attempts
    @correct_attempts = correct_attempts
  end

  def to_s
    "Question: #{self.question}\nAnswer: #{self.answer}"
  end

  
end


# test = Flashcard.new("Q", "A")