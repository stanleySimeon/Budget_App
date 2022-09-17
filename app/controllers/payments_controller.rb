class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @payment = Payment.where(category_id: params[:category_id]).order('created_at DESC')
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
    @categories = Category.where(user_id: current_user.id)
  end

  def edit; end

  def create
    @user = current_user
    @payment = @user.payments.new(payment_params)
    if @payment.save
      flash[:notice] = 'Payment was successfully created.'
      redirect_to category_payments_path
    else
      flash[:alert] = 'Payment was not created.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:notice] = 'Payment was successfully deleted.'
    redirect_to new_category_payment_path
  end

  private

  def set_payment
    @payment = Payment.includes(:user, :category).find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id, :user_id)
  end
end
