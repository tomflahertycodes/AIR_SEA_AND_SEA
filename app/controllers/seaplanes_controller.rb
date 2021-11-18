class SeaplanesController < ApplicationController
  before_action :find_seaplane, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @seaplanes = Seaplane.src_name_desc_location(params[:query])
    else
      @seaplanes = Seaplane.all
    end
    @markers = @seaplanes.geocoded.map do |seaplane|
      {
        lat: seaplane.latitude,
        lng: seaplane.longitude
      }
  end

  def show
  end

  def new
    @seaplane = Seaplane.new
  end

  def create
    @seaplane = Seaplane.new(seaplane_params)
    @seaplane.user_id = current_user.id
    if @seaplane.save!
      redirect_to seaplanes_path(@seaplane)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seaplane.update(seaplane_params)
      redirect_to seaplanes_path(@seaplane)
    else
      render :new
    end
  end

  def destroy
    @seaplane.destroy
    redirect_to seaplanes_path(@seaplane)
  end

  private

  def find_seaplane
    @seaplane = Seaplane.find(params[:id])
  end

  def seaplane_params
    params.require(:seaplane).permit(:name, :description, :location, :price, :category, :availability, :capacity, :photo)
  end
end
