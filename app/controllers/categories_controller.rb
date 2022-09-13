class CategoriesController < ApplicationController
  def index
    @categories = curent_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @payments = @category.payments.order('created_at DESC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully deleted.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
    category_params[:user_id] = current_user.id
    category_params
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
