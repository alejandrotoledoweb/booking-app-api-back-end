class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    json_response(@restaurants)
  end

  def create
    @restaurant = Restaurants.create!(restaurant_params)
    json_response(@restaurant, :created)
  end

  def show
    json_response(@restaurant)
  end

  def update
    @restaurant.update(restaurant_params)
    head :no_content
  end

  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def restaurant_params
    params.permit(:name, :description, :location, :avatar_link)
  end
end
