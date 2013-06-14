# require_relative 'flashcards.rb'\
require 'yaml'

class FileManager
  attr_reader :flashcards
  def initialize file = "flashcard_samples.txt"
    @pre_format_list  = []
    @flashcards       = []
    @file             = file
    File.exist?('flashcard_samples.yml') ? get_yaml : file_check
    puts file
  end

  def get_files
    IO.foreach(@file) do |line|
      @pre_format_list << line.chomp unless line.chomp == ""
    end
  end

  def file_check
    if @file == "flashcard_samples.txt"
      get_files
      seperate_input_array
      set_objects
    # else 
    #   get_yaml
    end
  end

  def get_yaml
    @file = 'flashcard_samples.yml' if @file == "flashcard_samples.txt"
    @flashcards = YAML::load(File.open(@file,'r'))
  end
# end

  def save_yaml
    @file = "flashcard_samples.yml" if @file == "flashcard_samples.txt"
    File.open(@file,"w") do |config|
      config.puts @flashcards.to_yaml   
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
  end
end

  # def save_to_file
  #   File.open('./bingo.yml','w') do |config|
  #     config..to_yaml
  #   end
  # end

  # def load_file
  #   @bingo = YAML::load(File.open('./bingo.yml','r'))
  # end

  # end


# x = Filemanager.new
