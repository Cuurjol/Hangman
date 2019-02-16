# Game "Hangman"

The program is a classic game "Hangman", where you need to guess the word with 7 attempts.

[Wiki page](https://en.wikipedia.org/wiki/Hangman_(game))

## Installing and using the program

The program was created on the __Ruby 2.5.1__ .

You need to install Ruby interpreter in order to work with this program.
[ruby](https://www.ruby-lang.org/en/news/2018/03/28/ruby-2-5-1-released)

The program uses such libraries (gems) as `rspec` and `i18n`.

Ensure that the library manager `bundler` is installed.

- Input in the __cmd__ or __terminal__ `gem install bundler`.
- After installing the library manager, input `bundler -v` in order to make sure that it was installed.
- Input `bundle install` for installing the necessary gems before running program.
- Input `bundle exec ruby main.rb` or `bundle exec ruby main.rb [locale]` for running program, where`[locale]` is a locale key.
There are two locale keys in the program such as `en` and `ru`.

## Main program files

- `main.rb` - running program file.
- `./data/WordsEN.txt` or `./data/WordsRU.txt` - text files, in which you can add new words and the program 
will take them from there.
- `./image/*.txt` - text images files files with text images (gallows) for different stages of the game.

## Custom locale

You can create your custom locale. For example, you want to make an internationalization of the game in German.
Then you need to commit the following steps:

- Create a new yaml file `de.yml` in the folder `config/locales`.
- Fill the file with necessary internationalization texts. Template of yaml file is below.
- Create a new txt file `WordsDE.txt` in the folder `data` for adding your words.
- Create a new text file `HangmanLogoDE.txt` in the folder 'data' for showing game logo and fil him some text image.
This step is an optional.

## Template yaml file

Examine the content of other yaml files (e.g. `en.yml`) in order to create your custom yaml file. Template yaml file is considered below:

```
[locale code]:
  main:
    input_word: "[internationalization text]"
    hidden_word: "[internationalization text] %{word}. [internationalization text]"
    existing_list_words: "[internationalization text] %{list_words}"
    add_or_delete_words: "[internationalization text]"
    counter_of_word: "[internationalization text]"
    operation_message: >
      [internationalization text]
    cyclic_input_words: "[internationalization text] %{number} [internationalization text]"
    wiktionary_invalid_message: "[internationalization text]"
    inputting_list_words: "[internationalization text] %{list_words}"
    total_list_words: "[internationalization text] %{list_words}"
    help:
      first_paragraph: >
        [internationalization text]
      second_paragraph: >
        [internationalization text]
      third_paragraph: >
        [internationalization text]
      fourth_paragraph: >
        [internationalization text]
  
  menu_game:
    logo_file: "[text image file]"
    items:
      - "[internationalization text]"
      - "[internationalization text]"
      - "[internationalization text]"
      - "[internationalization text]"
      - "[internationalization text]"
    game_title: "[internationalization text]"
    menu_title: "[internationalization text]"
    input_item: "[internationalization text]"
    item_alert_message: "[internationalization text]"
    notice_message: "[internationalization text]"
    possitive: "[internationalization text]"
    negative: "[internationalization text]"
    answer_alert_message: "[internationalization text]"
    exit_message: "[internationalization text]"
  
  game:
    alert_message: "[internationalization text]"
    input_next_letter: "[internationalization text]"
    repeat_next_letter: "[internationalization text]"
  
  result_printer:
    alert_no_image: "[internationalization text]"
    word: "[internationalization text] %{word}"
    mistakes: "[internationalization text] %{letter}"
    lose_message: "[internationalization text] %{word}."
    win_message: "[internationalization text]"
    count_leaving_mistakes: "[internationalization text] %{number}"
  
  word_list_controller:
    filename: "[text words file]"
  
  wiktionary:
    url: "[locale url]"
    wiktionary_search_pattern: "[locale mistake]"

  languages:
    en: "English"
    ru: "Русский"
    [locale code]: "[locale name]"
```

For example, for German language:

- [internationalization text] - your internationalization text in German: `Ich hoffe der Regen hört auf, denn ich habe meinen Regenschirm vergessen.`.
- [text words file] - the name of your text words file for game: `WordsDE.txt`.
- [text image file] - the name of your text image file for showing game logo: `HangmanLogoDE.txt`.
- [locale code] - the name of local code: `de`. [List of locale codes](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
- [locale name] - the name of language: `German`.
- [locale url] - the url of site __Wiktionary__: `https://de.wiktionary.org/wiki/%{word}` (`%{word}` does not need to remove). Visite the [site](https://www.wiktionary.org/) in order to find out if your language exists there or not.
- [locale mistake] - text alert message when word does not exist on the site __Wiktionary__: `Dieser Eintrag existiert noch nicht!`. You have to find this message for your language on the [site](https://www.wiktionary.org/) when some word does not exist and just copy that in your custom yaml file.
