Rails.application.routes.draw do
  root 'checklists#index'
  
  resources :checklists do
    resources :questions, only: [:create] do
      resources :answers, only: [:create, :destroy]
    end
  end

  resources :checklists do
    resources :audits
  end
  
  resources :audits, only: [:index]
end
