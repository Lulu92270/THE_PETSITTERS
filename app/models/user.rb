class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :pets, foreign_key: "pet_owner_id", class_name: "Pet"


  ROLE = ["Pet sitter", "Pet owner"]
  validates :name, :address, presence: true
  validates :role, inclusion: { in: ROLE }
end
