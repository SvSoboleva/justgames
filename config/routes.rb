Rails.application.routes.draw do
  root to: 'desks#index' 
  resources :desks, only: [:create, :index, :show], param: :token
end
