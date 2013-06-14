require_relative 'flashcards.rb'

class Filemanager
  attr_reader :flashcards
  def initialize
    @questions  = []
    @answers    = []
    @pre_format = []
    @flashcards = []
    get_files
    pre_format
    set_objects
  end

  def get_files
    IO.foreach("flashcard_samples.txt") do |line|
      # p line.chomp
    # p line.is_a? 
    # puts @answers
    @pre_format << line.chomp unless line.chomp == ""
  end
end

def pre_format
  @pre_format.each_with_index do |value, index|
    @questions << value if index.even?
    @answers   << value if index.odd?
  end
end

def set_objects
  @questions.each_with_index do |this_question, index|
    @flashcards << Flashcard.new(this_question, @answers[index])
  end

end



end

x = Filemanager.new
