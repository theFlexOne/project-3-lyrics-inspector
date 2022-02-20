require "rspotify"

class SpotifyController
  include RSpotify

  def self.get_artist_matches(artist_name, limit: 5)
    RSpotify::Artist.search(artist_name, limit: limit, market: "US")
  end

  def self.get_track_matches(track_name, limit: 5)
    RSpotify::Track.search(track_name, limit: limit, market: "US")
  end

  private

  def build_artist_hash_for_db
    SpotifyController.get_artist
  end
end
