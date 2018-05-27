class AlbumsController < ApplicationController
  before_action :find_artist
  before_action :find_album, only: [:show, :update, :destroy]

  def index
    render json: @artist.albums
  end

  def show
    render json: @album
  end

  def create
    @artist.albums.create!(album_params)
    render json: @artist, status: :created
  end

  def update
    @album.update(album_params)
    head :no_content
  end

  def destroy
    @album.destroy
    head :no_content
  end

  def album_params
    params.permit(:title, :year, :condition)
  end

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def find_album
    @album = @artist.albums.find_by!(id: params[:id]) if @artist
  end
end
