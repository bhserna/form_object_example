Rails.application.routes.draw do
  root to: redirect("/accounts")

  resources :accounts, only: [:new, :create, :index, :show] do
    resources :inflows, only: [:new, :create]
    resources :expenses, only: [:new, :create]
  end
end
