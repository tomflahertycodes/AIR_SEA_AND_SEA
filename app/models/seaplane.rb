class Seaplane < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, presence: true #(to be implemented)
  validates :capacity, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..6 }
end
