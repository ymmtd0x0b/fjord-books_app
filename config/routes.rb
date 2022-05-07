Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users, path_names: { sign_in: 'log_in', sign_out: 'log_out' }
  resources :books
  resources :users , only: [:index, :show]

  # Development
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
