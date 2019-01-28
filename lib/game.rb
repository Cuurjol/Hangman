class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters, :status

  MAX_ERRORS = 7.freeze

  def initialize(word)
    @pattern_for_word = /\A[[:alpha:]]+\z/
    @pattern_for_letter = /\A[[:alpha:]]\z/

    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = :in_progress # :won, :lost
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end

  def get_letters(word)
    if word == nil || word == "" || word.scan(@pattern_for_word).size != 1
      abort(I18n.t('game.alert_message'))
    end

    word.upcase.split("")
  end

  def next_step(letter)
    return nil if @status == :lost || @status == :won
    return nil if repeated?(letter)

    if is_good?(letter)
      add_letter_to(@good_letters, letter)
      @status = :won if solved?
    else
      add_letter_to(@bad_letters, letter)
      @errors += 1
      @status = :lost if lost?
    end
  end

  def ask_next_letter
    print("\n#{I18n.t('game.input_next_letter')} ")

    letter = STDIN.gets.chomp.upcase
    until letter.scan(@pattern_for_letter).size == 1
      print("#{I18n.t('game.repeat_next_letter')} ")
      letter = STDIN.gets.chomp.upcase
    end

    next_step(letter)
  end

  private

  def is_good?(letter)
    @letters.include?(letter) ||
      (@letters.include?("Ё") && letter == "Е") ||
      (@letters.include?("Е") && letter == "Ё") ||
      (@letters.include?("Й") && letter == "И") ||
      (@letters.include?("И") && letter == "Й")
  end

  def add_letter_to(letters, letter)
    letters.push(letter)

    case letter
    when "Е" then letters.push("Ё")
    when "Ё" then letters.push("Е")
    when "И" then letters.push("Й")
    when "Й" then letters.push("Ё")
    end
  end

  def solved?
    (@letters - @good_letters).empty?
  end

  def repeated?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end
end
