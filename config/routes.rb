Rails.application.routes.draw do
  root to: 'home#index'
 
  namespace :api do
    namespace :v1 do
      resources :dynamic_trees, only: [:show] do
        get :parent, on: :member
        get :children, on: :member
      end
    end
  end
end
