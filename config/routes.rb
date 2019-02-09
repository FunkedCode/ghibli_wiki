Rails.application.routes.draw do
  resources :films
  root to: 'films#index'

  resources :locations
  root to: 'locations#index'

  resources :characters
  root to: 'characters#index'

  resources :character_types
  root to: 'character_types#index'

  resources :top_movies
  root to: 'top_movies#index'

  get ":page" => "pages#show"
end
