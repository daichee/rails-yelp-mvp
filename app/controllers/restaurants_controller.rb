class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  def show
    @restaurant = restaurant_find
  end

  def edit
    @restaurant = restaurant_find
  end

  def update
    @restaurant = restaurant_find
    @restaurant.update(restaurant_params)

    redirect_to restaurants_path
  end

  def destroy
    @restaurant = restaurant_find
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  ## Strong Params
  def restaurant_find
    Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
