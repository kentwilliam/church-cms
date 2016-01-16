Rails.application.routes.draw do
  resources :posts
  resources :calendar_events

  # Routing in this app is largely handled by the root React component.
  # As such, we route any route to the home controller
  root 'home#index'
  match "*path", to: "home#index", via: :all
end
