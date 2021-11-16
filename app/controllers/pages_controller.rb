class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def search
    price_query = params[:price]
    category_query = params[:category]
    @seaplanes = Seaplane.where(category: category_query)
    @seaplanes = @seaplanes.where("price <= ?", price_query)
    render :home
  end
end
