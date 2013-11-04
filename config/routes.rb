Ebenezer::Application.routes.draw do
  
  devise_for :users, :skip => [:sessions]
  as :user do
    post   '/api/v1/login'   => 'sessions#create'
    delete '/api/v1/logout'  => 'sessions#destroy'
  end
  
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      get "/greet" => "messages#greet", :as => 'greet'
      resources :posts
    end
  end

end
