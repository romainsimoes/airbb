class Child < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :reviews
  has_many :bookings
  has_many :favorites

  mount_uploader :photo, PhotoUploader
end
