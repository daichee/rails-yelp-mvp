class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @review = review_find
  end

  def edit
    @review = review_find
  end

  def update
    @review = review_find
    @review.update(review_params)

    redirect_to restaurant_reviews_path(@review.restaurant)
  end

  def destroy
    @review = review_find
    @review.destroy
    redirect_to restaurant_reviews_path(@review.restaurant)
  end

  private

  ## Strong Params
  def review_find
    Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
