class BandSpace < ApplicationRecord
  has_one_attached :photo_url
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :description, presence: true
  validates :photo_url, presence: true
end

