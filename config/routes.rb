Rails.application.routes.draw do
  root 'application#index'

  get 'admin' => 'admin#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :projects, only: [:index, :show]

      namespace :admin do
        resources :projects
      end
    end
  end
end
