json.id order.id
json.current_user order.current_user
json.total order.total

json.formatted do
  json.total number_to_currency(order.total)
end
