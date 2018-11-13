json.id priority.id
json.user_id priority.user_id
json.tag do 
  json.partial! priority.tag, partial: 'api/tags/tag', as: :tag
end
json.percentage priority.percentage

json.formatted do 
  json.percentage priority.percentage.round(3)
end

json.vendors do
  json.array! current_user.vendors_within_budget(priority), partial: 'api/vendors/vendor', as: :vendor
end



