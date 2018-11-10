json.user_id priority.user_id
json.tag_id priority.tag_id
json.percentage priority.percentage

json.vendors do
  json.array! current_user.vendors_within_budget(priority), partial: 'api/vendors/vendor', as: :vendor
end



