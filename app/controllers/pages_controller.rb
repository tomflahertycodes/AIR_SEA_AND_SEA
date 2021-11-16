class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @seaplane_category = Seaplane.distinct.pluck(:category)
  end

  def search
    @seaplane_category = Seaplane.distinct.pluck(:category)
    price_query = params[:search][:price]
    category_query = params[:search][:category]
    capacity_query = params[:search][:capacity]
    @seaplanes = Seaplane.where(category: category_query)
    @seaplanes = @seaplanes.where("price <= ?", price_query)
    @seaplanes = @seaplanes.where("capacity >= ?", capacity_query)
    render :home
  end
end
