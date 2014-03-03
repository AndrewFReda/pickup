Pickup::Application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  match 'players/:id/leave/:game_id', to: 'players#leave_game', via: [:get, :post]

  resources :games
  resources :players
  root to: 'players#new'
end
