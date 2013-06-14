

class Filemanager

  def initialize
    @questions = []
    @answers   = []
    @answers << "what up"
    get_files
  end

  def get_files
    IO.foreach("flashcard_sample.txt") do |line|
      # p line.chomp
    # p line.is_a? 
    # puts @answers
    @answers << line.chomp unless line.chomp == ""
  end
  # puts @answers.count
  # puts @answers.compact!
  puts @answers.count
  
  end

end

x = Filemanager.new
