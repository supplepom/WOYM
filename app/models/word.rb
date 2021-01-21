
class Word < ApplicationRecord
  attachment :image
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :story
    validates :image
  end
end