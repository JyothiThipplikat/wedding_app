json.user_id priority.user_id
json.tag_id priority.tag_id
json.percentage priority.percentage

json.vendors do
  json.company_names current_user.formatted_vendors_within_budget(priority)
end