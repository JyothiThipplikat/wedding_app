class Priority < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates :tag_id, uniqueness: {scope: :user_id, message: "Can only choose a service once"}
  validates :percentage, numericality: {less_than_or_equal_to: 100}

end
