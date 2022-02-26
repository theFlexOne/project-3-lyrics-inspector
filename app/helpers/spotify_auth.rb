module SpotifyAuth
  # Authenticate SpotifyController
  id = ENV["SPOTIFY_ID"]
  secret = ENV["SPOTIFY_SECRET"]
  RSpotify::authenticate(id, secret)
end
