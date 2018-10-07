class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @chefs = @restaurant.chefs.all
    @foods = @restaurant.foods.all
  end
end
