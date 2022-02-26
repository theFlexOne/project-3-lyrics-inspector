require "rspotify"

class SpotifyController
  include RSpotify

  def get_user(s_id)
    user = User.find_by(spotify_id: s_id)
    if user
      return user
    else
      spotify_user = RSpotify::User.find(s_id)
      id = spotify_user.id
      display_name = spotify_user.display_name
      user_url = spotify_user.external_urls["spotify"]
      User.create(spotify_id: id, display_name: display_name, spotify_url: user_url)
    end
  end

  def self.get_username(id)
    RSpotify::User.find(id).display_name
  end

  def self.get_artist_matches(artist_name, limit: 5)
    RSpotify::Artist.search(artist_name, limit: limit, market: "US")
  end

  def self.get_track_matches(track_name, limit: 5)
    RSpotify::Track.search(track_name, limit: limit, market: "US")
  end

  def self.get_albums_for_artist(artist_name, limit: 10)
    RSpotify::Artist.search(artist_name, limit: limit, market: "US")
  end

  private

  def build_artist_hash_for_db
    SpotifyController.get_artist
  end
end
