Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :companies
  end
  
  resources :companies do
    resources :assigned_tax_codes
    resources :declarations do
      resources :transactions do
        resources :assigned_tax_codes
      end
    end
    resources :entities do 
      resources :declarations
    end
  end

end
