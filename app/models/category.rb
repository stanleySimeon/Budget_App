class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :payments

  validates :name, presence: true
  validates :user_id, presence: true

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
