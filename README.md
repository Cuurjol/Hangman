# Game "Hangman"

The program is a classic game "Hangman", where you need to guess the word with 7 attempts.

[Wiki page](https://en.wikipedia.org/wiki/Hangman_(game))

## Installing and using the program

The program is created on the __Ruby 2.5.1__ .

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
