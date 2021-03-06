json.id vendor.id
json.company_name vendor.company_name
json.address vendor.address
json.phone_number vendor.phone_number
json.description vendor.description
json.email vendor.email
json.availability vendor.availability
json.price vendor.price

json.image_urls do
  json.array! vendor.images.map {|i| i.url}
end

# json.images do
#   json.array! vendor.images, partial: 'api/images/image', as: :image 
# end
json.primary_image_url vendor.primary_image_url


json.tags do
  json.array! vendor.tags, partial: 'api/tags/tag', as: :tag
end


json.reviews do
  json.array! vendor.reviews, partial: 'api/reviews/review', as: :review
end

json.review_posts do
  json.array! vendor.reviews.map {|i| i.post}
end