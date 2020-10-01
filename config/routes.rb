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
  
  # If no route matches
  # match ":url" => "application#redirect_user", :constraints => { :url => /.*/ }
  # match '*path', via: :all, to: redirect('error/404')
  get '*path', to: 'errors#error_404', via: :all
end
