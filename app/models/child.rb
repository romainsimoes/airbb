class Child < ApplicationRecord
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  has_many :reviews, dependent: :nullify
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  mount_uploader :photo, PhotoUploader

  def user_favorite?(user_id)
    favorites.all.map(&:user_id).include?(user_id)
  end
end
