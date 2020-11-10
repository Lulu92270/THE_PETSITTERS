class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_one_attached :photo

  ROLE = ["petsitter", "petowner"]
  validates :name, :address, presence: true
  validates :role, inclusion: { in: ROLE }
end
