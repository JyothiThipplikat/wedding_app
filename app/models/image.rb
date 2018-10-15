class Image < ApplicationRecord
  belongs_to :vendor

  validates :image, presence: true
end
