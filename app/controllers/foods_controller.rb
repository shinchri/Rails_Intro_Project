class FoodsController < ApplicationController
  def index
    @foods = Food.page params[:page]
  end

  def show
    @food = Food.find(params[:id])
    @restaurants = @food.restaurants
  end
end
