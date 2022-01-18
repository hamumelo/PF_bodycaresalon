class Genre < ApplicationRecord

  has_many :treatments, dependent: :destroy

end
