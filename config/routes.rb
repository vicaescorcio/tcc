Rails.application.routes.draw do
  resources :comments
  resources :ideas
  resources :sectors
  resources :contests
  devise_for :members, :controllers => { :omniauth_callbacks => "callbacks", :registrations => 'members/registrations' }
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
