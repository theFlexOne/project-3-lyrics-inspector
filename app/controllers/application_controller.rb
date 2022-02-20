require_relative "spotify_controller.rb"

class ApplicationController < Sinatra::Base
  set :bind, "0.0.0.0"
  configure do
    enable :cross_origin
  end
  before do
    response.headers["Access-Control-Allow-Origin"] = "*"
  end

  get "/artist/:name" do
    content_type "application/json"

    matches = SpotifyController.get_artist_matches(params[:name])
    # binding.pry
    matches.to_json
  end

  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
end
