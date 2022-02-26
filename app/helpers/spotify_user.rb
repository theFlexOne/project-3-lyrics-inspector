DEFAULT_USER_ID = ENV["MY_SPOTIFY_USER_ID"]

class SpotifyUser
  attr_reader :user

  def initialize(id:)
    params = User.build_model_params(id)
    @user = User.find_by(spotify_id: id) || User.new(params)
  end

  def save_user
    self.user.save
  end

  def username
    self.user.display_name
  end

  def spotify_url
    self.user.external_urls["spotify"]
  end
end
