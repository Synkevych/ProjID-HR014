Rails.application.routes.draw do
  root 'checklists#index'
  
  resources :checklists do
    resources :questions, only: [:create]
  end

  resources :checklists do
    resources :audits, except: [:index, :create] do
        resources :answers, only: [:create, :edit]
    end
  end
  
  resources :audits, only: [:index]
  devise_for :users
end
