json.id carted_vendor.id
json.order_id carted_vendor.order_id
json.status carted_vendor.status

json.vendor do
  json.partial! carted_vendor.vendor, partial:"api/vendors/vendor", as: :vendor
end
