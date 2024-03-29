Rails.application.routes.draw do
  root to: 'homepage#index'
 
  namespace :api do
    namespace :v1 do
      resources :dynamic_trees, only: [:index, :show] do
        get :parent, on: :member
        get :children, on: :member
      end
    end
  end
end
