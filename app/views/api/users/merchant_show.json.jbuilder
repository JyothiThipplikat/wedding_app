json.vendors do
  json.array! merchant.vendors, partial: 'api/vendors/vendor', as: :vendor
end

