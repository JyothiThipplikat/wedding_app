json.id vendor.id
json.company_name vendor.company_name
json.address vendor.address
json.phone_number vendor.phone_number
json.description vendor.description
json.email vendor.email
json.availability vendor.availability
json.price vendor.price

json.tags do
  json.array! vendor.tags, partial: 'api/tags/tag', as: :tag
end

json.images do
  json.array! vendor.images, partial: 'api/images/image', as: :image 
end