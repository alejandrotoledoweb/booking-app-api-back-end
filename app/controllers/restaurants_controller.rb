class RestaurantsController < ApplicationController
  # GET /todos
  def index
    # get current user todos
    @restaurants = Restaurant.all
    json_response(@restaurants)
  end

  # POST /todos
  def create
    # create todos belonging to current user
    @restaurant = Restaurants.create!(restaurant_params)
    json_response(@restaurant, :created)
  end

  # GET /todos/:id
  def show
    json_response(@restaurant)
  end

  # PUT /todos/:id
  def update
    @restaurant.update(restaurant_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def restaurant_params
    params.permit(:name, :description, :location, :avatar_link)
  end

end
