class BoatsController < ApplicationController
  before_action :find_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boats.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to boats_path(@boat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boats_path(@boat)
    else
      render :new
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path(@boat)
  end

  private

  def find_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :location, :price, :category, :availability, :capacity)
  end
end
