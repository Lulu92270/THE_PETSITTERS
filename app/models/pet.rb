class Pet < ApplicationRecord
  belongs_to :pet_owner, class_name: "User", foreign_key: "user_id"
  has_one_attached :photo
end
