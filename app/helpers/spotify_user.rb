DEFAULT_USER_ID = ENV["MY_SPOTIFY_USER_ID"]

class SpotifyUser
  attr_reader :user

  def initialize(id = DEFAULT_USER_ID)
    @user = User.new(id)
  end

  def username
    self.user.display_name
  end

  def spotify_url
    self.user.external_urls["spotify"]
  end
end
