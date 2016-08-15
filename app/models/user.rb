class User < ApplicationRecord
  before_create :fill_profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :children
  has_many :reviews
  has_many :favorites
  has_many :bookings
  has_one :profile

  private
    def fill_profile
      if !self.profile
        self.profile = Profile.new(user: self)
      end
    end
end
