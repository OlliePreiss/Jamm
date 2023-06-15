class MusicStudiosController < ApplicationController
  def index
    @data = JSON.parse(File.read("#{Rails.root}/public/music_studios.json"))
  end
end
