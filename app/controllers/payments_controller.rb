class PaymentsController < ApplicationController
  def load_and_authorize_resource
    @payment = Payment.find(params[:id])
    authorize! :manage, @payment
  end

  def index
    @payments = Payment.all
  end

  def show
    load_and_authorize_resource
  end

  def new
    @payment = Payment.new
    @categories = Category.includes(user_id: current_user.id)
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.save
    redirect_to @payment
  end

  def destroy
    load_and_authorize_resource
    @payment.destroy
    redirect_to payments_path
  end
end
