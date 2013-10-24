Ebenezer::Application.routes.draw do
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      get "/greet" => "pages#greet", :as => 'greet'
    end
  end
end
