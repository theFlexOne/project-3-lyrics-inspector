require "pry"
require "httparty"
require "yaml"

class APIController
  def self.get_track_lyrics(artist:, song:)
    base_url = "http://api.chartlyrics.com/apiv1.asmx/SearchLyricDirect?"
    artist = "artist=#{artist}"
    song = "song=#{song}"
    response = HTTParty.get("#{base_url}#{artist}&#{song}")
    response["GetLyricResult"]
  end
  # def self.get_artist_info(name)
  #   base_url = "http://api.music-story.com/artist/search?"
  #   yaml = YAML.load_file("keys.yml")
  #   token = "oauth_token=#{yaml[:"OAuth Access Token"]}"
  #   signature = "oauth_signature=#{yaml[:"OAuth Token Secret"]}"
  #   name = "name=#{name.split(" ").join("%20")}"
  #   HTTParty.get("#{base_url}#{name}&#{token}&#{signature}")
  # end
end

# binding.pry
