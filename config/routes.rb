Rails.application.routes.draw do
root to: 'jobs#dashboard'
  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments
    end
  end
  resources :categories
  resources :tags
  get 'jobs' => 'jobs#sort'
  get 'dashboard' => 'jobs#dashboard'
end
