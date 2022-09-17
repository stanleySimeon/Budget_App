require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(email: 'johndoe@gmail.com', password: 'password', icon: 'icon')
  before { user.save }

  it 'should respond to email' do
    expect(user).to respond_to(:email)
  end

  it 'should respond to password' do
    expect(user).to respond_to(:password)
  end

  it 'should respond to icon' do
    expect(user).to respond_to(:icon)
  end

  it 'should respond to have payments' do
    expect(user).to respond_to(:payments)
  end

  it 'should respond to have categories' do
    expect(user).to respond_to(:categories)
  end
end
