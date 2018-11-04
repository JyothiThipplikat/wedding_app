Rails.application.routes.draw do
  namespace :api do
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"

    post "/sessions" => "sessions#create"

    post "/priorities" => "priorities#create"

    post "/bookings"=> "bookings#create"

    get "/images" => "images#index"
    post "/images" => "images#create"
    get "/images/:id" => "images#show"
    patch "/images/:id" => "images#update"
    delete "/images/:id" => "images#destroy"

    post "/reviews" => "reviews#create"
    get "/reviews/:id" => "reviews#show"
    patch "/reviews/:id" => "reviews#update"
    delete "/reviews/:id" => "reviews#destroy"

    get "/tags" => "tags#index"
    post "/tags" => "tags#create"
    get "/tags/:id" => "tags#show"
    patch "/tags/:id" => "tags#update"
    delete "/tags/:id" => "tags#destroy"

    get "/vendors" => "vendors#index"
    post "/vendors" => "vendors#create"
    get "/vendors/:id" => "vendors#show"
    patch "/vendors/:id" => "vendors#update"
    delete "/vendors/:id" => "vendors#destroy"

    get "/carted_vendors" => "carted_vendors#index"
    post "/carted_vendors" => "carted_vendors#create"
    get "/carted_vendors/:id" => "carted_vendors#show"
    delete "/carted_vendors/:id" => "carted_vendors#destroy"

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
  end
end
