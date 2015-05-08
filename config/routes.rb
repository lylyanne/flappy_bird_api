Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    resources :scores, only: [:index, :create]
  end
end
