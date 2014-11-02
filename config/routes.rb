Rails.application.routes.draw do
  root 'application#index'

  get 'admin' => 'admin#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :projects, only: [:index, :show]

      namespace :admin do
        resources :projects, except: [:new, :edit] do
          resource :images, only: [:index, :create, :update, :destroy]
          patch 'images/upload/:id', to: 'images#upload', as: 'images_upload'
        end
        resources :categories, only: [:index]
      end
    end
  end
end
