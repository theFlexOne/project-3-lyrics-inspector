require_relative "spotify_controller.rb"
require_relative "../helpers/spotify_auth.rb"
require "sinatra/cross_origin"

class ApplicationController < Sinatra::Base
  include SpotifyAuth

  # I don't know what this is doing...
  set :bind, "0.0.0.0"
  configure do
    enable :cross_origin
  end
  before do
    response.headers["Access-Control-Allow-Origin"] = "*"
  end
  # ----------------------------------

  get "/user/:id" do
    user = SpotifyController.get_user(params[:id])
    user.to_json
  end

  get "/artist/:name" do
    content_type "application/json"
    matches = SpotifyController.get_artist_matches(params[:name])
    matches.to_json
  end

  get "/artist/albums/:name" do
    content_type "application/json"
    albums = SpotifyController.get_albums_for_artist(params[:name]).first.albums
    # binding.pry
    albums.to_json
  end

  get "/album/:name" do
    content_type "application/json"
    matches = SpotifyController.get_artist_matches(params[:name])
    matches.to_json
  end

  # I don't know what this is doing...
  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
  # ----------------------------------
end
