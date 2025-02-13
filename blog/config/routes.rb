Rails.application.routes.draw do
  get "home/index" => "home#index"  # Opción explícita

   root "tasks#index"
  resources :tasks
end

