class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy

  validates :name, :amount, presence: true

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
