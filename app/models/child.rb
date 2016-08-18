class Child < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :reviews
  has_many :bookings
  has_many :favorites

  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  mount_uploader :photo, PhotoUploader

  def user_favorite?(user_id)
    favorites.all.map(&:user_id).include?(user_id)
  end
end
