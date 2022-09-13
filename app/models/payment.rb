class Payment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :category, class_name: 'Category'

  validates :amount, presence: true
  validates :date, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
