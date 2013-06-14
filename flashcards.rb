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

  def increment_wrong_attempts
    self.wrong_attempts = self.wrong_attempts + 1
  end

  def increment_correct_attempts
    self.correct_attempts = self.correct_attempts + 1
  end

  def display_question
    puts "Question:"
    puts question
  end

  def check_answer (user_answer)
    user_answer == answer
  end
end


# test = Flashcard.new("Q", "A")