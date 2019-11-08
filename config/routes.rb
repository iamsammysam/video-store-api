Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, only: [:index, :show]
  resources :movies, only: [:index, :show, :create]

  post "/rentals/check-out", to: "rentals#checkout", as: "checkout"
  post "/rentals/check-in", to: "rentals#checkin", as: "checkin"
  # resources :rentals, only: [:index, :show, :create]

end
