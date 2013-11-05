LittleCommits::Application.routes.draw do
  post "validate_config", :to => "subscription#create"
  post "/endpoint/:token", :to => "editions#create", :as => "endpoint"
end
