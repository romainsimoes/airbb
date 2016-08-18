class Child < ApplicationRecord
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  has_many :reviews, dependent: :nullify
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  mount_uploader :photo, PhotoUploader
end
