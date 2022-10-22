class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :payments, dependent: :destroy, foreign_key: 'category_id'
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates :user_id, presence: true

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
