# Game "Hangman"

The program is a classic game "Hangman", where you need to guess the word with 7 attempts.

[Wiki page](https://en.wikipedia.org/wiki/Hangman_(game))

## Installing and using the program

The program was created on the __Ruby 2.5.1__ .

You need to install Ruby interpreter in order to work with this program.
[ruby](https://www.ruby-lang.org/en/news/2018/03/28/ruby-2-5-1-released)

The program uses such libraries (gems) as __rspec__ and __i18n__.

Ensure that the library manager __bundler__ is installed.

- Input in the __cmd__ or __terminal__ the following command:
  ```
  gem install bundler
  ```
- After installing the library manager, input the next command in order to make sure that it was installed:
  ```
  bundler -v
  ```
- Input the next command for installing the necessary gems before running program:
  ```
  `bundle install`
  ```
- Input the next command for running program:
  ```
  bundle exec ruby main.rb
  ```
  or
  ```
  bundle exec ruby main.rb [locale]
  ```
  where __[locale]__ is a locale key. There are two locale keys in the program such as __en__ and __ru__.

## Main program files

- `main.rb` - running program file.
- `./data/WordsEN.txt` or `./data/WordsRU.txt` - text files, in which you can add new words and the program 
will take them from there.
- `./image/*.txt` - text images files files with text images (gallows) for different stages of the game.

## Custom locale

You can create your custom locale. For example, you want to make an internationalization of the game in German.
Examine the content of other yaml files (e.g. `en.yml`) in order to create your custom yaml file.
Then you need to commit the following steps:

- Create a new yaml file `de.yml` in the folder `config/locales`.
- Fill the file with necessary internationalization texts. The `template.yaml` file is located in the `config/locales` folder.
- Create a new txt file `WordsDE.txt` in the folder `data` for adding your words.
- Create a new text file `HangmanLogoDE.txt` in the folder 'data' for showing game logo and fil him some text image.
This step is an optional.

## Demo

You can watch a demo version of the game at the [link](https://asciinema.org/a/ByesWSUHhQeU6gjPcMXVlSnRN).

## Author

**Kirill Ilyin**, study project from [goodprogrammer.ru](https://goodprogrammer.ru/)
