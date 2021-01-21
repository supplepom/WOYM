
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :words, dependent: :destroy
  attachment :profile_image

  validates :name, presence: true
end
