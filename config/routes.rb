Rails.application.routes.draw do

  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments
    end
  end
  resources :categories
end
