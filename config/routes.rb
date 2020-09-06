Rails.application.routes.draw do
  root 'checklists#index'
  
  resources :checklists do
    resources :questions do
      resources :answers, exept: [:show]
    end
    resources :audits
  end

  resources :audits, only: [:index]

end
