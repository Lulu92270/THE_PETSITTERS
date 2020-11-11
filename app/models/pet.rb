class Pet < ApplicationRecord
  belongs_to :pet_owner, class_name: "User"
  has_one_attached :photo
end
