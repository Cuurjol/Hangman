class WordListController
  def initialize
    @work_directory_path = Dir.pwd
    @data_folder = "data"
    @words_file = I18n.t('word_list_controller.filename')
    @pattern = Regexp.new(I18n.t('word_list_controller.pattern'))

    words_file_path = File.join(@work_directory_path, @data_folder, @words_file)
    if File.exists?(words_file_path)
      @array = File.readlines(words_file_path, encoding: "UTF-8", chomp: true)
      @array.each { |elem| elem.upcase! }
    else
      file = File.new(words_file_path, "a:UTF-8")
      @array = []
    end
  end

  def add_word(word)
    words_file_path = File.join(@work_directory_path, @data_folder, @words_file)
    file = File.new(words_file_path, "a:UTF-8")
    file.puts(word)
    file.close
    @array.push(word)
  end

  def delete_word(word)
    words_file_path = File.join(@work_directory_path, @data_folder, @words_file)
    @array.delete(word.upcase)
    file = File.new(words_file_path, "w:UTF-8")
    @array.each { |elem| file.puts(elem)  }
    file.close
  end

  def search_word?(word)
    return @array.include?(word.upcase)
  end

  def select_random_word
    return @array == [] ? nil : @array.sample
  end

  def print_list
    return @array.to_s
  end
end
