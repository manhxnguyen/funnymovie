Rails.application.routes.draw do
  resources :movies do
    member do
      post :vote_movie
      post :unvote_movie
    end
  end
  resources :votes do
  end
  devise_for :users
  root "movies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
