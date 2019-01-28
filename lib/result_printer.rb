class ResultPrinter
  def initialize(game)
    @status_image = []

    0.upto(game.max_errors) do |i|
      file_name = File.join(Dir.pwd, "images", "#{i}.txt")
      if File.exist?(file_name)
        file = File.new(file_name, "r:UTF-8")
        @status_image.push(file.read)
        file.close
      else
        @status_image.push("\n #{I18n.t('result_printer.alert_no_image')} \n")
      end
    end
  end

  def print_hangman(errors)
    puts(@status_image[errors])
  end

  def print_status(game)
    system("clear") || system("cls")

    puts(I18n.t('result_printer.word', word: get_word_for_print(game.letters, game.good_letters)))
    puts(I18n.t('result_printer.mistakes', letter: game.bad_letters.join(", ")))

    print_hangman(game.errors)

    if game.lost?
      puts(I18n.t('result_printer.lose_message', word: game.letters.join("")))
    elsif game.won?
      puts(I18n.t('result_printer.win_message'))
    else
      puts(I18n.t('result_printer.count_leaving_mistakes', number: game.errors_left))
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""
    letters.each do |item|
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    end

    return result
  end
end
