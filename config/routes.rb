Rails.application.routes.draw do
  root 'application#index'

  get 'admin' => 'admin#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :projects, only: [:index, :show]

      namespace :admin do
        resources :projects, except: [:new, :edit] do
          resources :images, only: [:create, :update, :upload, :destroy]
        end
        resources :categories, only: [:index, :create, :destroy]
      end
    end
  end
end
