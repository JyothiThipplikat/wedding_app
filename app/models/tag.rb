class Tag < ApplicationRecord
  has_many :vendor_tags
  has_many :vendors, through: :vendor_tags

  validates :name, uniqueness: true
end
