class Treatment < ApplicationRecord

  has_many :reservations, dependent: :destroy
  belongs_to :genre
  belongs_to :user

  attachment :image

  default_scope -> { order(created_at: :desc) }

end
