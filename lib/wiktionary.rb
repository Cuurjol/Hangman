require "net/http"

class Wiktionary
  def self.valid_word?(word)
    url = I18n.t('wiktionary.url', word: word.downcase)
    word_pattern = /\A[[:alpha:]]+\z/
    wiktionary_search_pattern = Regexp.new(I18n.t('wiktionary.wiktionary_search_pattern'))

    return nil until word.scan(word_pattern).size == 1

    wiktionary_page = Net::HTTP.get(URI.parse(URI.encode(url))).force_encoding("UTF-8")
    if wiktionary_page =~ wiktionary_search_pattern
      return false
    else
      return true
    end
  end
end
