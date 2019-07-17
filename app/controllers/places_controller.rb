class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    @place_type = Place.place_type
    @locations = Place.locations
  end

  def create
    @place = Place.new(place_params)
    @place_type = Place.place_type
    @locations = Place.locations

    if @place.save
      flash[:notice] = "Place added successfully!"
      redirect_to places_path
    else
      flash.now[:error] = "Please fill out correctly!"
      render :new
    end
  end
end

  private

  def place_params
    params.require(:place).permit(:name, :description, :place_type, :location)
  end
