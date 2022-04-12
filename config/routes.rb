Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: 'users/omniauth_callbacks',
                                    confirmations: 'users/confirmations', sessions: "users/sessions"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "tweets#index"

  get 'profile', to: 'tweets#my_tweets'

  resources :users do
    member do
      get :confirm_email
    end
    get "search", on: :collection
  end

  resources :tweets do
    resources :likes
    resources :comments
    member do
      post :retweet
    end
  end
  resource :friendships, only: [:create, :destroy]

end
