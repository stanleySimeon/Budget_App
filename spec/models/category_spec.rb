require 'rails_helper'

RSpec.describe Category, type: :model do
  category = Category.new(name: "Test Category")
  before { category.save }

  it "should respond to name" do
    expect(category).to respond_to(:name)
  end

  it "should respond to image" do
    expect(category).to respond_to(:image)
  end

  it "should respond to have payments" do
    expect(category).to respond_to(:payments)
  end
end
