require_relative "../../app/models/artist.rb"

EXAMPLE_ARTIST = {
  name: "EMINEM",
  spotify_id: "random1131231237",
  popularity: 100,
}

describe Artist do
  it "has the correct attributes: id, name, spotify_id, popularity" do
    attribute_names = Artist.attribute_names
    expect(attribute_names).to eq(["id", "name", "spotify_id", "popularity"])
  end
  it "can get/set attributes" do
    artist = Artist.new
    artist.name = "EMINEM"
    artist.spotify_id = "random1131231237"
    artist.popularity = 100
    expect(artist.name).to eq("EMINEM")
    expect(artist.spotify_id).to eq("random1131231237")
    expect(artist.popularity).to eq(100)
  end
end
