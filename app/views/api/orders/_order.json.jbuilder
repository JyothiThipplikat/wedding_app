json.id order.id
json.user order.user
json.total order.total

json.formatted do
  json.total number_to_currency(order.total)
end
