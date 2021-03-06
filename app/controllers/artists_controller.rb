class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(params.require(:artist).permit(:name, :bio))
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    if @artist = Artist.update(params.require(:artist).permit(:name, :bio))
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end
end
