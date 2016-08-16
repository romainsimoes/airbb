class Account::ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_child, only: [:new, :edit, :create, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.child = @child
    @review.user = current_user
    if @review.save
      redirect_to account_child_path(@child)
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to account_review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to account_reviews_path
  end

  private

  def set_review
    @review = review.find(params[:id])
  end

  def find_child
    @child = Child.find(params[:child_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :child_id)
  end

end
