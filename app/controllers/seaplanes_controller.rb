class SeaplanesController < ApplicationController
  before_action :find_seaplane, only: [:show, :edit, :update, :destroy]

  def index
    @seaplanes = Seaplane.all
  end

  def show
  end

  def new
    @seaplane = Seaplane.new
  end

  def create
    @seaplane = Seaplane.new(boat_params)
    if @seaplane.save
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
    params.require(:seaplane).permit(:name, :description, :location, :price, :category, :availability, :capacity)
  end
end
