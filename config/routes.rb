Rails.application.routes.draw do
  root to: 'desks#index' 
  resources :desks, only: [:create, :index, :show], param: :token

  mount ActionCable.server => '/cable'
end
