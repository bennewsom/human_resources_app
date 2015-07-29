Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :companys
  end
  
  resources :companys do
    resources :departments do
      resources :employees do
        resources :leave_totals
      end
    end
  end

  
  root 'home#index'

end