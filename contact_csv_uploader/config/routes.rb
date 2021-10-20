Rails.application.routes.draw do
  devise_for :users
  root 'contacts#index'

  resources :contacts do
    collection { post :import }
  end

  resources :csv_files
end
