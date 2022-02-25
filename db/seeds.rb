puts "Seeding..."

# fetching my Spotify playlists
playlists = RSpotify::User.find("3174uilmw5y5bls52mcyadu6mpwe").playlists

# creating a new playlist in db for each spotify playlist
playlists.each do |playlist|
  Playlist.create(name: playlist.name, spotify_id: playlist.id)
end

# preloading genres...
top_50_genres = RSpotify::Category.list(country: "US", limit: 50).map { |g| { name: g.name, spotify_id: g.id } } # <- max is 50
top_50_genres.each do |genre|
  Genre.find_or_create_by(name: genre[:name], spotify_id: genre[:spotify_id])
end

Playlist.all.each do |playlist|
  RSpotify::Playlist.find("3174uilmw5y5bls52mcyadu6mpwe", playlist.spotify_id).tracks.map do |track|
    s_artist = track.artists.first
    s_album = track.album

    artist = Artist.find_or_create_by(name: s_artist.name, spotify_id: s_artist.id, popularity: s_artist.popularity)
    album = Album.find_or_create_by(name: s_album.name, spotify_id: s_album.id, release_date: s_album.release_date, artist_id: artist.id)

    s_artist.genres.each do |genre_name|
      genre_name_spaces = genre_name.titlecase
      genre = Genre.find_or_create_by(name: genre_name_spaces)
      ArtistGenre.find_or_create_by(genre_id: genre.id, artist_id: artist.id)
    end

    new_track = Track.find_or_create_by(name: track.name, spotify_id: track.id, duration_s: (track.duration_ms / 1000), album_id: album.id)
    PlaylistTrack.create(playlist_id: playlist.id, track_id: new_track.id)
  end
end

puts "Seeding done!"
