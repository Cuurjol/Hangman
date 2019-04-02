require 'i18n'
require_relative 'lib/menu_game'
require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_list_controller'
require_relative 'lib/wiktionary'

system("clear") || system("cls")

I18n.load_path << Dir[File.expand_path('config/locales') + '/*.yml'].reject { |file| file.end_with?('template.yml') }

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

locales = I18n.available_locales

if !ARGV.empty? && locales.include?(ARGV[0].to_sym)
  I18n.locale = ARGV[0]
else
  puts("List of available locales:\n\n")
  I18n.available_locales.each_with_index { |e, i| puts("#{i + 1}: #{I18n.t("languages.#{e}")}") }

  print("\nEnter the locales code: ")
  code = STDIN.gets.to_i

  abort("\nFatal error! Wrong local code. The game went out in emergency mode.") if code <= 0 || code > locales.count

  I18n.locale = locales[code - 1]
end

menu_game = MenuGame.new

until menu_game.state == 5
  system("clear") || system("cls")
  menu_game.show_logo
  menu_game.show_menu_items
  menu_game.state = menu_game.input_user_pick

  case menu_game.state
  when 1
    word_list_controller = WordListController.new
    word = word_list_controller.select_random_word
    game = Game.new(word)
    result_printer = ResultPrinter.new(game)

    while game.in_progress?
      result_printer.print_status(game)
      game.ask_next_letter
    end

    result_printer.print_status(game)
    menu_game.exit_question
  when 2
    system("clear") || system("cls")

    print("#{I18n.t('main.input_word')} ")
    word = STDIN.gets.chomp

    game = Game.new(word)
    result_printer = ResultPrinter.new(game)
    while game.in_progress?
      result_printer.print_status(game)
      game.ask_next_letter
    end

    result_printer.print_status(game)

    word_list_controller = WordListController.new
    if Wiktionary.valid_word?(word)
      unless word_list_controller.search_word?(word)
        word_list_controller.add_word(word)
        puts(I18n.t('main.hidden_word', word: word.upcase))
      end
    else
      print("#{I18n.t('main.wiktionary_invalid_message')}\n")
    end

    menu_game.exit_question
  when 3
    system("clear") || system("cls")

    word_list_controller = WordListController.new
    puts(I18n.t('main.existing_list_words', list_words: word_list_controller.print_list))
    print("\n#{I18n.t('main.add_or_delete_words')} ")

    counter = STDIN.gets.to_i
    until counter > 0
      print("#{I18n.t('main.counter_of_word')} ")
      counter = STDIN.gets.to_i
    end

    puts("\n#{I18n.t('main.operation_message')}\n")

    input_words = []
    1.upto(counter) do |i|
      print("\n#{I18n.t('main.cyclic_input_words', number: i)} ")
      word = STDIN.gets.chomp
      input_words.push(word)

      if Wiktionary.valid_word?(word)
        word_list_controller.search_word?(word) ? word_list_controller.delete_word(word) : word_list_controller.add_word(word)
      else
        print("#{I18n.t('main.wiktionary_invalid_message')}\n")
      end
    end

    print("\n\n#{I18n.t('main.inputting_list_words', list_words: input_words)}\n")
    print("#{I18n.t('main.total_list_words', list_words: word_list_controller.print_list)}\n\n")
    menu_game.exit_question
  when 4
    system("clear") || system("cls")

    menu_game.help
    menu_game.exit_question
  when 5
    menu_game.exit
  end
end
