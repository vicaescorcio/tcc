Rails.application.routes.draw do
  resources :comments
  
  
  resources :ideas do
    get "show_map", to: "ideas#map"
      member do
          put "like", to: "ideas#like"
          put "dislike", to: "ideas#dislike"
      end
  end    

  resources :sectors
 
  resources :contests do
    get "show_map", to: "contests#map"
    #put "new_contest_idea", to: "contests#new"
  end
 
  get "filter", to: "home#filtering"
 
  devise_for :members, :controllers => { :omniauth_callbacks => "callbacks", :registrations => 'members/registrations', :sessions =>'members/sessions' }
  
  root 'home#index'
  
  #get "ideas/new_idea" => 'ideas#new_idea', :as => :new_idea
  #post "ideas/create" => "ideas#create", :as => :create_idea
  
  #get "contests/new_contest" => 'contests#new_contest', :as => :new_contest
  #post "contests/create" => "contests#create", :as => :create_contest
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
