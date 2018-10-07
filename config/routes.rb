Rails.application.routes.draw do
  namespace :api do
    get "/vendors" => "vendors#index"
    get "vendors/:id" => "vendors#show"
    post "/vendors" => "vendors#create"
    patch "vendors/:id" => "vendors#update"
    delete "/vendors/:id" => "vendors#destroy"
  end
end
