class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :payments
  has_one_attached :icon, dependent: :destroy

  validates :icon, presence: true, file_content_type: { allow: ["image/jpeg", "image/jpg", "image/avif", "image/png"] }, file_size: { less_than: 3.megabytes }

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_cnfirmation, :current_password, :icon, :provider, :uid])
  end  
end
