class ChefsController < ApplicationController
  def index
    @chefs = Chef.page params[:page]
  end

  def show
    @chef = Chef.find(params[:id])
    @restaurant = @chef.restaurant
    @specialty_foods = @chef.restaurant.foods.take(3)
  end
end
