Rails.application.routes.draw do
  namespace :api do
    get "/tags" => "tags#index"
    get "/tags/:id" => "tags#show"
    post "/tags" => "tags#create"
    patch "/tags/:id" => "tags#update"
    delete "/tags/:id" => "tags#destroy"

    get "/vendors" => "vendors#index"
    get "vendors/:id" => "vendors#show"
    post "/vendors" => "vendors#create"
    patch "vendors/:id" => "vendors#update"
    delete "/vendors/:id" => "vendors#destroy"

    get "/carted_vendors" => "carted_vendors#index"
    post "/carted_vendors" => "carted_vendors#create"
    delete "/carted_vendors/:id" => "carted_vendors#destroy"
  end
end
