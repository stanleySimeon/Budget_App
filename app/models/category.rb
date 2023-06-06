class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :payments, dependent: :destroy, foreign_key: 'category_id'
  has_one_attached :image, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true, file_size: { less_than: 3.megabytes }, file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/avif', 'image/png'] }
  validates :user_id, presence: true

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
