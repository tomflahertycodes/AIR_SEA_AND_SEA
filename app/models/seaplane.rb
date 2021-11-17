class Seaplane < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, presence: true #(to be implemented)
  validates :capacity, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..6 }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
