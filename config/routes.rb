LittleCommits::Application.routes.draw do
  post "validate_config", :to => "subscription#create"
  post "/endpoint/:token", :to => "editions#create", :as => "endpoint"
  get "unsubscribe/:token", :to => "subscription#destroy", :as => "unsubscribe"
end
