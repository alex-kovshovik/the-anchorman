Rails.application.routes.draw do
  resources :toilets, :defaults => {format: :json} do
    patch 'keepalive', on: :member
  end

  resources :groups

  root 'homes#index'
end
