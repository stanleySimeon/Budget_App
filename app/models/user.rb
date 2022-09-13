class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :categories
  has_many :payments

  validates :name, presence: true, uniqueness: true
end
