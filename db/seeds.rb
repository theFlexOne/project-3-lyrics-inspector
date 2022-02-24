puts "Seeding..."

# fetching my Spotify playlists
playlists = RSpotify::User.find("3174uilmw5y5bls52mcyadu6mpwe").playlists

# creating a new playlist in db for each spotify playlist
playlists.each do |playlist|
  Playlist.create(name: playlist.name, spotify_id: playlist.id)
end

Playlist.all.each do |playlist|
  RSpotify::Playlist.find("3174uilmw5y5bls52mcyadu6mpwe", playlist.spotify_id).tracks.map do |track|
    s_artist = track.artists.first
    s_album = track.album

    artist = Artist.find_or_create_by(name: s_artist.name, spotify_id: s_artist.id, popularity: s_artist.popularity)
    album = Album.find_or_create_by(name: s_album.name, spotify_id: s_album.id, release_date: s_album.release_date, artist_id: artist.id)

    s_album.genres.each do |s_genre|
      genre = Genre.find_or_create_by(name: s_genre.name, spotify_id: s_genre.id)
      AlbumGenre.find_or_create_by(genre_id: genre.id, album_id: album.id)
    end

    new_track = playlist.tracks.find_or_create_by(name: track.name, spotify_id: track.id, duration_s: (track.duration_ms / 1000))
    PlaylistTrack.create(playlist_id: playlist.id, track_id: new_track.id)
  end
end

binding.pry

puts "Seeding done!"
