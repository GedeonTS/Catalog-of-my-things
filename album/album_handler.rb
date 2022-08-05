require 'json'
require_relative './music_album'
require_relative '../genre/genre_handler'

module MusicAlbumModule
  include GenreModule

  def list_all_music_albums(music_albums)
    if File.exist?('./album/files/music_album.json')
      music_albums = []
      file = File.read('./album/files/music_album.json')
      albums = JSON.parse(file)
      albums.each do |element|
        music_albums.push(element)
      end
    end
    puts 'Music Albums:'
    music_albums.each do |album|
      puts "- Genre:#{album['name']}, Date:#{album['publish_date']}, Spotify: #{album['on_spotify']}"
    end
    puts 'No Albums found' if music_albums.length.zero?
  end

  def add_music_album(genres)
    print 'Publish Date [YYYY-MM-DD]: '
    publish_date = gets.chomp
    print 'On Spotify [Y/N]: '
    on_spotify = gets.chomp
    on_spotify = on_spotify.downcase != 'n'
    puts 'Select a genre from the following list by number'
    list_genres(genres)
    genre = gets.chomp.to_i
    if genre < genres.length
      music_album = MusicAlbum.new(publish_date, false, on_spotify)
      music_album.add_genre(genres[genre.to_i])
      if File.empty?('./album/files/music_album.json')
        @albums = []
      else
        file = File.read('./album/files/music_album.json')
        @albums = JSON.parse(file)
      end
      data = { id: music_album.id, publish_date: music_album.publish_date, archived: music_album.archived,
               genre: music_album.genre.id, name: music_album.genre.id, on_spotify: on_spotify }
      @albums.push(data)
      File.write('./album/files/music_album.json', JSON(@albums))
      puts 'Music album created successfully ✅'
      music_album
    else
      puts 'Please enter a valid genre num'
    end
  end
end
