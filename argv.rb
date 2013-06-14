require_relative 'flashcards'
require_relative 'filemanager'
require_relative 'game_controller'


def argument_handler

  # file check/load
  # honestly this is here use the local variable for ARGV calls
  # it's small and another instance variable here seems a bit odd




  if ARGV.empty?
    # puts "If you need help, type help for a list of commands... \nor yell 'ANNNE!! ANNNE!!!' loudly"
    if File.exist?('flashcard_samples.txt')
      file_manager = FileManager.new
      game = Game_controller.new(file_manager.flashcards)
      game.run_game!
    # puts "YAML Loaded"
  # elsif File.exist?('./recipie.csv')
  #   snatch_a_list = RecipieParser.new
  #   snatch_a_list.read_recipie
  #   list = List.new(snatch_a_list.recipie)
    # puts "CSV Loaded"
  else
    puts "No File Loaded"
  end
else
  case ARGV[0]
  # when  "help"      then list.print_help
  # when  "delete"    then list.delete_task(ARGV[1].to_i-1)
  # when  "list"      then list.print_list
  when  "load"      then file_manager = FileManager.new(ARGV[1])
    # when  "add"       then list.add_task(ARGV[1..-1].join(' '))
    # when  "complete"  then list.complete_task(ARGV[1].to_i-1)
  else puts "Unknown command, please try again or type 'help'."
  end
end

file_manager.save_yaml
end

argument_handler
