class Pet < ApplicationRecord
  belongs_to :pet_owner, class_name: "User"
  has_many :bookings
  has_one_attached :photo
end
