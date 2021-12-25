Rails.application.routes.draw do
  get 'transfers/new'
  root to: redirect("/accounts")

  resources :accounts, only: [:new, :create, :index, :show] do
    resources :inflows, only: [:new, :create]
    resources :expenses, only: [:new, :create]
    resources :transfers, only: [:new, :create]
  end
end
