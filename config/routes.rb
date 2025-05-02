Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "static#home"

  controller :static do
    get :home
  end

  resource :favorites, only: %i[ create destroy ]
  resource :session, only: %i[ new create destroy ]

  resources :categorization_quizzes, only: %i[index show]
  resources :collections, only: %i[index]
  resources :flash_cards, only: %i[index]
  resources :passwords, param: :token
  resources :quizzes, only: %i[index]
  resources :users, only: %i[ new create ]

  draw :api
  draw :admin
  draw :native
end
