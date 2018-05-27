class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :update, :destroy]

  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    render json: @artist
  end

  def create
    @artist = Artist.create!(valid_params)
    render json: @artist, status: :created
  end

  def update
    @artist.update(valid_params)
    head :no_content
  end

  def destroy
    @artist.destroy
    head :no_content
  end

  def valid_params
    params.permit(:name)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
