class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  mount_uploader :photo, PhotoUploader
end
