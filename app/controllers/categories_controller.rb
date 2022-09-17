class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.includes(:user, :payments).order('created_at DESC')
  end

  def show
    @payments = Payment.where(category_id: params[:id]).order('created_at DESC')
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to new_category_payment_url(@category)
    else
      flash[:alert] = 'Category was not created.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category was successfully deleted.'
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
