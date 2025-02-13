Rails.application.routes.draw do
  get "/hola", to: "hola#index"

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "hola#index"
end
