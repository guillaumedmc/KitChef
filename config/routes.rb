Rails.application.routes.draw do
  devise_for :users
   root to: "pages#home"
   get 'users/:id', to: "users#show", as: 'users/profile'
   resources :users, only: [ :edit, :update ]

   resources :products do
    resources :bookings, except: [:index]
   end
   resources :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
