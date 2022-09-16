require 'rails_helper'

RSpec.describe Payment, type: :model do
  payment = Payment.new(amount: 100, name: "Test Payment")
  before { payment.save }

  it "should respond to amount" do
    expect(payment).to respond_to(:amount)
  end

  it "should respond to name" do
    expect(payment).to respond_to(:name)
  end
end
