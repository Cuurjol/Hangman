require 'i18n'
require 'game'

describe 'Game' do
  context 'when word is Russian' do
    before(:each) do
      I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
      I18n.locale = :ru
    end

    it 'user wins the game' do
      game = Game.new('богомол')
      expect(game.status).to eq :in_progress

      game.next_step 'Б'
      game.next_step 'О'
      game.next_step 'Г'
      game.next_step 'Л'
      game.next_step 'М'

      expect(game.errors).to eq 0
      expect(game.status).to eq :won
    end

    it 'user loses the game' do
      game = Game.new('астма')

      game.next_step 'Г'
      game.next_step 'Р'
      game.next_step 'П'
      game.next_step 'У'
      game.next_step 'Т'
      game.next_step 'О'
      game.next_step 'Х'
      game.next_step 'Н'

      expect(game.errors).to eq 7
      expect(game.status).to eq :lost
    end
  end

  context 'when word is English' do
    before(:each) do
      I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
      I18n.locale = :en
    end

    it 'user wins the game' do
      game = Game.new('elephant')
      expect(game.status).to eq :in_progress

      game.next_step 'E'
      game.next_step 'L'
      game.next_step 'P'
      game.next_step 'H'
      game.next_step 'A'
      game.next_step 'N'
      game.next_step 'T'

      expect(game.errors).to eq 0
      expect(game.status).to eq :won
    end

    it 'user loses the game' do
      game = Game.new('revenge')

      game.next_step 'A'
      game.next_step 'O'
      game.next_step 'U'
      game.next_step 'Y'
      game.next_step 'D'
      game.next_step 'S'
      game.next_step 'C'
      game.next_step 'T'

      expect(game.errors).to eq 7
      expect(game.status).to eq :lost
    end
  end
end
