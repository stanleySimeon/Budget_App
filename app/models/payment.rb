class Payment < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories, dependent: :destroy

  validates :name, :amount, presence: true

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
