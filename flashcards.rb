# Main file for 

class Flashcard
  attr_reader :question, :answer

  def initialize(question, answer)

    @question = question
    @answer = answer
  end

  def to_s
    "Question: #{self.question}\nAnswer: #{self.answer}"
  end
end


# test = Flashcard.new("Q", "A")