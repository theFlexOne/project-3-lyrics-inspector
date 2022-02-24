require "pry"
require "rspotify"
require "yaml"

# Authenticate SpotifyController
keys = YAML.load_file("keys.yml")
id = keys[:spotify_client_id]
secret = keys[:spotify_client_secret]
RSpotify::authenticate(id, secret)

USER_ID = "3174uilmw5y5bls52mcyadu6mpwe"

user = RSpotify::User.find(USER_ID)
tracks = user.playlists.map do |playlist|
  playlist.tracks.map do |track|
    { name: track.name, artist: track.artists.first.name, album: track.album.name, spotify_id: id, duration_s: (track.duration_ms / 1000) }
  end
end.flatten

binding.pry
