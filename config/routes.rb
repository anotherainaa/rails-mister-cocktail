Rails.application.routes.draw do
  root to: "cocktails#index"

  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:index, :new, :create]
  end
  resources :doses, only: [:destroy]

end
