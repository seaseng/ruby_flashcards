require_relative 'flashcards.rb'

class Filemanager
  attr_reader :flashcards
  def initialize 
    @pre_format_list  = []
    @flashcards       = []
    get_files
    seperate_input_array
    set_objects
  end

  def get_files
    IO.foreach("flashcard_samples.txt") do |line|
    @pre_format_list << line.chomp unless line.chomp == ""
  end
end

def seperate_input_array
  @questions  = []
  @answers    = []
  @pre_format_list.each_with_index do |value, index|
    @questions << value if index.even?
    @answers   << value if index.odd?
  end
end

def set_objects
  @questions.each_with_index do |this_question, index|
    @flashcards << Flashcard.new(this_question, @answers[index])
  end

  def save_to_file
    File.open('./bingo.yml','w') do |config|
      config..to_yaml
    end
  end

  def load_file
    @bingo = YAML::load(File.open('./bingo.yml','r'))
  end

  end

end

# x = Filemanager.new
