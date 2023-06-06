class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :payments
  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true, file_content_type: { allow: ["image/jpeg", "image/jpg", "image/avif", "image/png"] }, file_size: { less_than: 3.megabytes }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :password, presence: true, length: { minimum: 6, maximum: 30 }
end
