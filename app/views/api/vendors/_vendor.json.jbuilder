json.id vendor.id
json.company_name vendor.company_name
json.address vendor.address
json.phone_number vendor.phone_number
json.description vendor.description
json.email vendor.email
json.availability vendor.availability
# json.price vendor.price

json.images do
  json.array! product.images, partial: 'api/images/image', as: :image 
end

