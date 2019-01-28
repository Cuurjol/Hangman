class MenuGame
  attr_accessor :state

  def initialize
    @state = 0
    @work_directory_path = Dir.pwd
    @data_folder = "data"
    @images_folder = "images"
    @menu_items = I18n.t('menu_game.items')
    @logo_file = I18n.t('menu_game.logo_file')
  end

  def show_logo
    logo_file_path = File.join(@work_directory_path, @data_folder, @logo_file)
    lines = File.exists?(logo_file_path) ? File.readlines(logo_file_path, encoding: "UTF-8") : "#{I18n.t('menu_game.game_title')}\n\n"
    puts(lines)
  end

  def show_menu_items
    puts(I18n.t('menu_game.menu_title'))
    @menu_items.each_with_index { |item, index| puts("#{index + 1}: #{item}") }
  end

  def input_user_pick
    print("\n#{I18n.t('menu_game.input_item')} ")
    item = STDIN.gets.to_i
    while item <= 0 || item > @menu_items.size
      print("#{I18n.t('menu_game.item_alert_message')} ")
      item = STDIN.gets.to_i
    end

    return item
  end

  def help
    puts(I18n.t('main.help.first_paragraph'))
    puts("\n#{I18n.t('main.help.second_paragraph')}")
    puts("\n#{I18n.t('main.help.third_paragraph')}")
    puts("\n#{I18n.t('main.help.fourth_paragraph')}\n")
  end

  def exit_question
    puts(I18n.t('menu_game.notice_message'))
    answer = STDIN.gets.chomp.downcase
    until answer == I18n.t('menu_game.possitive') || answer == I18n.t('menu_game.negative')
      print("#{I18n.t('menu_game.answer_alert_message')} ")
      answer = STDIN.gets.chomp.downcase
    end

    if answer == I18n.t('menu_game.possitive')
      @state = 5
      exit
    end
  end

  def exit
    system("clear") || system("cls")
    puts(I18n.t('menu_game.exit_message'))
  end
end
