require "rspotify"

# AUTH_IDS = YAML.load_file("keys.yml")
# RSpotify.authenticate AUTH_IDS[:spotify_client_id], AUTH_IDS[:spotify_client_secret]

class SpotifyController
  include RSpotify

  def self.get_artist(artist_name)
    artist = RSpotify::Artist.search(artist_name)
    binding.pry
  end

  def self.get_track(track_name)
    track = RSpotify::Track.search(track_name)
    binding.pry
  end

  private
end
