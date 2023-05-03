#file: spec/application_spec.rb

require 'application'


RSpec.describe Application do
  let(:album_repository) { double(:album_repository) }
  let(:artist_repository) { double(:artist_repository) }
  let(:io) { double(:io) }
  let(:application) { Application.new('music_library', io, album_repository, artist_repository) }

  describe '#run' do
    it 'displays a welcome message' do
      allow(io).to receive(:puts)

      application.run

      expect(io).to have_received(:puts).with('Welcome to the music library manager!')
    end

    it 'displays a list of albums when the user chooses option 1' do
      allow(io).to receive(:gets).and_return('1', "\n")
      allow(io).to receive(:puts)

      allow(album_repository).to receive(:all).and_return([
        {'id' => 1, 'title' => 'Doolittle'}, 
        {'id' => 2, 'title' => 'Surfer Rosa'}, 
        {'id' => 3, 'title' => 'Waterloo'},
        {'id' => 4, 'title' => 'Super Trouper'}, 
        {'id' => 5, 'title' => 'Bossanova'}, 
        {'id' => 6, 'title' => 'Lover'}, 
        {'id' => 7, 'title' => 'Folklore'}, 
        {'id' => 8, 'title' => 'I put a Spell on You'}, 
        {'id' => 9, 'title' => 'Baltimore'}, 
        {'id' => 10, 'title' => 'Here Comes the Sun'}, 
        {'id' => 11, 'title' => 'Fodder on My Wing'}, 
        {'id' => 12, 'title' => 'Ring Ring'}
      ])

      application.run

      expect(io).to have_received(:puts).with('Here is the list of albums:')
      expect(io).to have_received(:puts).with(' * 1 - Doolittle')
      expect(io).to have_received(:puts).with(' * 2 - Surfer Rosa')
      expect(io).to have_received(:puts).with(' * 3 - Waterloo')
      expect(io).to have_received(:puts).with(' * 4 - Super Trouper')
      expect(io).to have_received(:puts).with(' * 5 - Bossanova')
      expect(io).to have_received(:puts).with(' * 6 - Lover')
      expect(io).to have_received(:puts).with(' * 7 - Folklore')
      expect(io).to have_received(:puts).with(' * 8 - I put a Spell on You')
      expect(io).to have_received(:puts).with(' * 9 - Baltimore')
      expect(io).to have_received(:puts).with(' * 10 - Here Comes the Sun')
      expect(io).to have_received(:puts).with(' * 11 - Fodder on My Wing')
      expect(io).to have_received(:puts).with(' * 12 - Ring Ring')
    end

    it 'displays a list of artists when the user chooses option 2' do
      allow(io).to receive(:gets).and_return('2', "\n")
      allow(io).to receive(:puts)

      allow(artist_repository).to receive(:all).and_return([
        {'id' => 1, 'name' => 'Pixies'}, 
        {'id' => 2, 'name' => 'Pixies'}, 
        {'id' => 3, 'name' => 'ABBA'}, 
        {'id' => 4, 'name' => 'ABBA'}, 
        {'id' => 5, 'name' => 'Pixies'}, 
        {'id' => 6, 'name' => 'Taylor Swift'}, 
        {'id' => 7, 'name' => 'Taylor Swift'}, 
        {'id' => 8, 'name' => 'Nina Simone'}, 
        {'id' => 9, 'name' => 'Nina Simone'}, 
        {'id' => 10, 'name' => 'The Beatles'}, 
        {'id' => 11, 'name' => 'Nina Simone'}, 
        {'id' => 12, 'name' => 'ABBA'} 
      ])

      application.run

      expect(io).to have_received(:puts).with('Here is the list of artists:')
      expect(io).to have_received(:puts).with(' * 1 - Pixies')
      expect(io).to have_received(:puts).with(' * 2 - Pixies')
      expect(io).to have_received(:puts).with(' * 3 - ABBA')
      expect(io).to have_received(:puts).with(' * 4 - ABBA')
      expect(io).to have_received(:puts).with(' * 5 - Pixies')
      expect(io).to have_received(:puts).with(' * 6 - Taylor Swift')
      expect(io).to have_received(:puts).with(' * 7 - Taylor Swift')
      expect(io).to have_received(:puts).with(' * 8 - Nina Simone')
      expect(io).to have_received(:puts).with(' * 9 - Nina Simone')
      expect(io).to have_received(:puts).with(' * 10 - The Beatles')
      expect(io).to have_received(:puts).with(' * 11 - Nina Simone')
      expect(io).to have_received(:puts).with(' * 12 - ABBA')
    end
  end
end

