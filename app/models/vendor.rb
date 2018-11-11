class Vendor < ApplicationRecord
  belongs_to :user

  has_many :images
  has_many :vendor_tags
  has_many :tags, through: :vendor_tags

  has_many :reviews 
  has_many :bookings
  has_many :users, through: :bookings
  
  has_many :carted_vendors

  has_many :orders, through: :carted_vendors

  def available?(compare_date)
    !(users.map {|user| user.date }.include?(compare_date))
  end

  def primary_image_url
    check_images = images
    if check_images.any? && check_images.select { |v| v.primary_image }.any?
      check_images.select { |v| v.primary_image }.first.url
    else
      "https://i1.wp.com/res.cloudinary.com/aleteia/image/fetch/c_fill,g_auto,w_620,h_310/https://aleteiaen.files.wordpress.com/2017/06/web3-wedding-rings-hands-marriage-husband-wife-bride-groom-shutterstock_251860978-shutterstock.jpg%3Fw%3D1200?quality=100&strip=all&ssl=1"
    end
  end


end
