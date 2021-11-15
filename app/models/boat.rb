class Boat < ApplicationRecord
  #belongs_to :user
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, presence: true #(to be implemented)
  validates :availability, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..6 }
end
