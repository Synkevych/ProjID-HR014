Rails.application.routes.draw do
  root 'checklists#index'
  
  resources :checklists do
    resources :questions, only: [:create, :new]
  end

  resources :checklists do
    resources :audits, except: [:index] do
        resources :answers, only: [:create]
    end
  end
  
  resources :audits, only: [:index]
  devise_for :users
end
