require "pry"
require "httparty"

class APIController
  def get_track(artist:, song:)
    base_url = "http://api.chartlyrics.com/apiv1.asmx/SearchLyricDirect?"
    artist = "artist=#{artist}"
    song = "song=#{song}"
    response = HTTParty.get("#{base_url}#{artist}&#{song}")
    track = response["GetLyricResult"]
  end
end

binding.pry
