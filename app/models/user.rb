class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :orders
  has_many :carted_vendors, through: :orders
  
  has_many :reviews
  has_many :bookings

  has_many :priorities
  has_many :tags, through: :priorities

  has_many :vendors

  def merchant
    @merchant
  end

  def customer
    @customer
  end

  def shopping_cart
    carted_vendors.where(status: "carted")
  end

end
