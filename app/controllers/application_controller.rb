class ApplicationController < Sinatra::Base
  get "/artist/:name" do
    binding.pry
  end
end
